# 由 hlmd/postman-chinese-injector 的 scripts/update-pkg-manifests.js 自动生成,请勿手改
class PostmanChineseInjector < Formula
  desc "Postman 桌面端非官方汉化工具(与 Postman, Inc. 无关)"
  homepage "https://github.com/hlmd/postman-chinese-injector"
  version "1.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.1/postman-chinese-injector-macos-arm64.tar.xz"
      sha256 "13731486bae604de7f5f215cdb7aa0529b1d17c6c204e822e146a818273befa1"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.1/postman-chinese-injector-macos-x64.tar.xz"
      sha256 "d54764218a157d16561cae56d6ebee4928ea1e31be713de27129dcb9dee45848"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.1/postman-chinese-injector-linux-arm64.tar.xz"
      sha256 "f9a3712218c1eb25beec2eb6457408fb7beafa99d90d2f4ae8111d40c067606c"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.1/postman-chinese-injector-linux-x64.tar.xz"
      sha256 "a0c96142298efd1705ba3f0761708b175e527c9c9313383e419e1174b68d877b"
    end
  end

  def install
    binary = Dir["postman-chinese-injector-*"].first
    chmod 0755, binary
    bin.install binary => "postman-chinese-injector"
  end

  def caveats
    <<~EOS
      运行前请完全退出 Postman。
      注入: postman-chinese-injector    繁體: postman-chinese-injector --lang zh-TW    还原: postman-chinese-injector restore    帮助: postman-chinese-injector -h
      程序由 Homebrew 管理（已关闭自更新），升级请用：brew upgrade postman-chinese-injector
      Linux 上 Postman 装在 /opt 等系统目录时可能需要 sudo。
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/postman-chinese-injector --version")
  end
end
