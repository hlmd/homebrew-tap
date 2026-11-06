# 由 hlmd/postman-chinese-injector 的 scripts/update-pkg-manifests.js 自动生成,请勿手改
class PostmanChineseInjector < Formula
  desc "Postman 桌面端非官方汉化工具(与 Postman, Inc. 无关)"
  homepage "https://github.com/hlmd/postman-chinese-injector"
  version "1.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.9.0/postman-chinese-injector-macos-arm64.tar.xz"
      sha256 "3ba8857cc21b9f04e3dd87967f757537e7c18c36b6bee79100f679e5f8a9c8cf"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.9.0/postman-chinese-injector-macos-x64.tar.xz"
      sha256 "1d119147938cd213fd9a9f1177c2a7c426b73a5b70059dfd5dac79972aceb3ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.9.0/postman-chinese-injector-linux-arm64.tar.xz"
      sha256 "01d85f7454c9347b6effb6080c0d17cbae12665ed1b245e5ce6a21468af7dc86"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.9.0/postman-chinese-injector-linux-x64.tar.xz"
      sha256 "185d7ba5905f4c0d68d6824859e5517088ced1e9d08f451f68bc81c28cd1baf0"
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
