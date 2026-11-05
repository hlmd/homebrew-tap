# 由 hlmd/redis-insight-chinese 的 scripts/gen-packaging.js 自动生成,请勿手改
class RedisInsightChinese < Formula
  desc "Redis Insight 桌面端非官方汉化工具(与 Redis Ltd. 无关)"
  homepage "https://github.com/hlmd/redis-insight-chinese"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.0/redis-insight-chinese-macos-arm64.tar.xz"
      sha256 "1ea52fadfc806c0a3f6e5087241b21313e546418d5c23699c5d0504d2038dd95"
    end
    on_intel do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.0/redis-insight-chinese-macos-x64.tar.xz"
      sha256 "4d0ad22d045bb8db6a9320f871d6c092a1039d522dfd7b242b331ff87e3163c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.0/redis-insight-chinese-linux-arm64.tar.xz"
      sha256 "abcfe19a8771559ffa8a8a6435e0cdf14fd1b2970ab196f9ab6bd20101b50f25"
    end
    on_intel do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.0/redis-insight-chinese-linux-x64.tar.xz"
      sha256 "e7e1278030efcd80cc6c9f7e59abafde87cfa7dd500d4af29d86633d96c9b71a"
    end
  end

  def install
    binary = Dir["redis-insight-chinese-*"].reject { |f| f.end_with?(".tar.xz") }.first
    odie "压缩包里没有找到可执行文件" if binary.nil?
    chmod 0755, binary
    bin.install binary => "redis-insight-chinese"
    # CI 在 Linux 上交叉编译,产物无签名;Apple Silicon 要求至少 ad-hoc 签名,否则启动即被杀
    system "codesign", "--force", "--sign", "-", bin/"redis-insight-chinese" if OS.mac?
  end

  def caveats
    <<~EOS
      运行前请完全退出 Redis Insight(包括托盘 / 菜单栏图标)。
        注入:  redis-insight-chinese
        还原:  redis-insight-chinese restore
      Redis Insight 装在 /Applications 时,可能需要 sudo redis-insight-chinese。
      程序更新请用 brew upgrade redis-insight-chinese(Homebrew 安装时不自更新)。
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/redis-insight-chinese version")
  end
end
