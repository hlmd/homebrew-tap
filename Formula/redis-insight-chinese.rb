# 由 hlmd/redis-insight-chinese 的 scripts/gen-packaging.js 自动生成,请勿手改
class RedisInsightChinese < Formula
  desc "Redis Insight 桌面端非官方汉化工具(与 Redis Ltd. 无关)"
  homepage "https://github.com/hlmd/redis-insight-chinese"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.3/redis-insight-chinese-macos-arm64.tar.xz"
      sha256 "7fd2306c2a8e87bb1728c214e9434012c8edb19459860934bb657cf7261fd145"
    end
    on_intel do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.3/redis-insight-chinese-macos-x64.tar.xz"
      sha256 "739923372ec376f421de80079465ed3c20a31b3e39bfd562251a5c8770fdb47e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.3/redis-insight-chinese-linux-arm64.tar.xz"
      sha256 "73a842f5dfff2453fe01ed473ed39bea040f97fd87e15ba5f60474f903e5c2fa"
    end
    on_intel do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.3/redis-insight-chinese-linux-x64.tar.xz"
      sha256 "af34ff7ccb6e1628c46b2451e79fd47f1b90c4f38f949e83b9531bb45fb31b77"
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
