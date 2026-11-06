# 由 hlmd/postman-chinese-injector 的 scripts/update-pkg-manifests.js 自动生成,请勿手改
class PostmanChineseInjector < Formula
  desc "Postman 桌面端非官方汉化工具(与 Postman, Inc. 无关)"
  homepage "https://github.com/hlmd/postman-chinese-injector"
  version "1.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.0/postman-chinese-injector-macos-arm64.tar.xz"
      sha256 "39a37325ee17ccd0d4d32336c161ca07474305946bcc514365e687854a720c67"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.0/postman-chinese-injector-macos-x64.tar.xz"
      sha256 "252fde5d1e172e359e4bfbd6ad400059c6a4ec00a1939f7fa667bd5bb462ca00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.0/postman-chinese-injector-linux-arm64.tar.xz"
      sha256 "cd6cfc7db79026b497fa78003b2c3b90a7fdcf27d734292ef9e24f1eb507c422"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.0/postman-chinese-injector-linux-x64.tar.xz"
      sha256 "8682e050e4f2ebff9b85b7b75f23161e13d8c1f89e4dbdb3cce5c13b5720fd59"
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
