# 由 hlmd/postman-chinese-injector 的 scripts/update-pkg-manifests.js 自动生成,请勿手改
class PostmanChineseInjector < Formula
  desc "Postman 桌面端非官方汉化工具(与 Postman, Inc. 无关)"
  homepage "https://github.com/hlmd/postman-chinese-injector"
  version "1.11.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.3/postman-chinese-injector-macos-arm64.tar.xz"
      sha256 "21c1f67479414f13f1ed687ba95e83f2f5e0774825a824c3c2881cc00354abcb"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.3/postman-chinese-injector-macos-x64.tar.xz"
      sha256 "2aa95431ef692af7a576e6ea658530e3bcdac7d104a162a94e931f0c3d84c5d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.3/postman-chinese-injector-linux-arm64.tar.xz"
      sha256 "26030b7b9287ad02f445dab021637e485117f6f3e246220e9bf510b6948100f9"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.11.3/postman-chinese-injector-linux-x64.tar.xz"
      sha256 "4039d3e667fdd8f133027bbffcefd0726a1a17e1af6056bbd7194886e0d2dc44"
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
