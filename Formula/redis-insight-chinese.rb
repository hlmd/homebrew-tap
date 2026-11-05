# 由 hlmd/redis-insight-chinese 的 scripts/gen-packaging.js 自动生成,请勿手改
class RedisInsightChinese < Formula
  desc "Redis Insight 桌面端非官方汉化工具(与 Redis Ltd. 无关)"
  homepage "https://github.com/hlmd/redis-insight-chinese"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.2/redis-insight-chinese-macos-arm64.tar.xz"
      sha256 "44f18affb7ffb7f0e6b0a593f5f01986cbf33d6f40d283994b9e450e23781bb4"
    end
    on_intel do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.2/redis-insight-chinese-macos-x64.tar.xz"
      sha256 "7e9195ec34bfc5147cfa4f26cd0d03282c9af0d4567a7f2ecb0fd8619037cb9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.2/redis-insight-chinese-linux-arm64.tar.xz"
      sha256 "66710ca35acc29380d4b8cb939545a6a7c5a72e43fac967a96c1807932ed6518"
    end
    on_intel do
      url "https://github.com/hlmd/redis-insight-chinese/releases/download/v0.3.2/redis-insight-chinese-linux-x64.tar.xz"
      sha256 "b0f6ce61d8a431f4ec2cf3d18df53635eac0c8e537b1162ec9fb576d5811bab1"
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
