# 由 hlmd/postman-chinese-injector 的 scripts/update-pkg-manifests.js 自动生成,请勿手改
class PostmanChineseInjector < Formula
  desc "Postman 桌面端非官方汉化工具(与 Postman, Inc. 无关)"
  homepage "https://github.com/hlmd/postman-chinese-injector"
  version "1.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.10.0/postman-chinese-injector-macos-arm64.tar.xz"
      sha256 "77532b6ca0319588c764f3fb448d7d761279ecd8dbd35d2019d7aa72c96c7314"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.10.0/postman-chinese-injector-macos-x64.tar.xz"
      sha256 "1f284335453ba82bb4c8f930372e0c09646af034258040b69a2b09d33ea3661a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.10.0/postman-chinese-injector-linux-arm64.tar.xz"
      sha256 "f0d8215c3a61b7671b76b53d68dc018855de33907488831a0fc9668c77bfa1ae"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.10.0/postman-chinese-injector-linux-x64.tar.xz"
      sha256 "56ef334faabb476c4e91da60a56d5118507e3ad687aea406c29e572e01db3672"
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
