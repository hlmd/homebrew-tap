# 由 hlmd/postman-chinese-injector 的 scripts/update-pkg-manifests.js 自动生成,请勿手改
class PostmanChineseInjector < Formula
  desc "Postman 桌面端非官方汉化工具(与 Postman, Inc. 无关)"
  homepage "https://github.com/hlmd/postman-chinese-injector"
  version "1.11.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.2/postman-chinese-injector-macos-arm64.tar.xz"
      sha256 "21f1410e453d189eb57f86933873b37efe5d99bdb9856fd5ef9b4b00a5294122"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.2/postman-chinese-injector-macos-x64.tar.xz"
      sha256 "28ca793a80f907cb436f1cbdfd20bda2812c34b803475103d8fe8d1c821fba7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.2/postman-chinese-injector-linux-arm64.tar.xz"
      sha256 "a11ae7f4329ceb26b8d1be60a7783a7da4f386501e8476a4384f4a93dfcdd1ec"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.2/postman-chinese-injector-linux-x64.tar.xz"
      sha256 "a785d4ef774c9159ca3efd78a6f40977164c54dff8b1c621b1ef0d03ad7ff7e6"
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
