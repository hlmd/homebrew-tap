# 由 hlmd/postman-chinese-injector 的 scripts/update-pkg-manifests.js 自动生成,请勿手改
class PostmanChineseInjector < Formula
  desc "Postman 桌面端非官方汉化工具(与 Postman, Inc. 无关)"
  homepage "https://github.com/hlmd/postman-chinese-injector"
  version "1.11.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.4/postman-chinese-injector-macos-arm64.tar.xz"
      sha256 "17da90158493f023bd48ebbff144983b1f1af40ac9cb3432868d331dd94d8011"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.4/postman-chinese-injector-macos-x64.tar.xz"
      sha256 "73bf2b23a54fc9240e444dcc5b98606a92eb7781e4cdf5771e92b23597683d74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.4/postman-chinese-injector-linux-arm64.tar.xz"
      sha256 "f9d7750b2a35222d593193a53280a1fa911f222247b8c418bd0abb1080b8f739"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.4/postman-chinese-injector-linux-x64.tar.xz"
      sha256 "9c64c234e9873ef5c33f2cbff6408ce014f4221710b8190335dfeba58f16f3e1"
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
