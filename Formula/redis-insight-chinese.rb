# 由 hlmd/redis-insight-chinese 的 scripts/gen-packaging.js 自动生成,请勿手改
class RedisInsightChinese < Formula
  desc "Redis Insight 桌面端非官方汉化工具(与 Redis Ltd. 无关)"
  homepage "https://github.com/hlmd/redis-insight-chinese"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.4/redis-insight-chinese-macos-arm64.tar.xz"
      sha256 "b4f5b83198ebba6318fa94c82d026e1deac9d5591af97ef42cca6d6f7745eb0a"
    end
    on_intel do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.4/redis-insight-chinese-macos-x64.tar.xz"
      sha256 "d880d53f8ea1b2cc660ee507e9cce3d64bc76b3ec6cb7a5571e4b83571ae1f2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.4/redis-insight-chinese-linux-arm64.tar.xz"
      sha256 "2bf9599bb7990188be3c6b89cbf4ee0de723247b4a625e4ea5aaabb277dd9f68"
    end
    on_intel do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.4/redis-insight-chinese-linux-x64.tar.xz"
      sha256 "cfbe4352db7e08f55df9d4630a471b842cba45f03aa8de42e4efe53f88197833"
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
