# 由 hlmd/redis-insight-chinese 的 scripts/gen-packaging.js 自动生成,请勿手改
class RedisInsightChinese < Formula
  desc "Redis Insight 桌面端非官方汉化工具(与 Redis Ltd. 无关)"
  homepage "https://github.com/hlmd/redis-insight-chinese"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.1/redis-insight-chinese-macos-arm64.tar.xz"
      sha256 "519d9e8c2c59f8fda7720f5f37b0cf8a4e92f87812edfa1e52f20f4ee030af85"
    end
    on_intel do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.1/redis-insight-chinese-macos-x64.tar.xz"
      sha256 "c71fa6c720f1e713cc4bdb4cb75acb7dd85b4b61c53341939ff1cbca328381e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.1/redis-insight-chinese-linux-arm64.tar.xz"
      sha256 "968822aba246ca39b0352936f9cdf0be99ac8c7598ac9d789b78d3e54a9343c9"
    end
    on_intel do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.1/redis-insight-chinese-linux-x64.tar.xz"
      sha256 "a496a143e379558475fb7b710106ac89fb919e25c9cdd69e22ff1166b30067ed"
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
