# 由 hlmd/postman-chinese-injector 的 scripts/update-pkg-manifests.js 自动生成,请勿手改
class PostmanChineseInjector < Formula
  desc "Postman 桌面端非官方汉化工具(与 Postman, Inc. 无关)"
  homepage "https://github.com/hlmd/postman-chinese-injector"
  version "1.8.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.8.5/postman-chinese-injector-macos-arm64.tar.xz"
      sha256 "37352ba872e0961dfaff585dfd929729497790ecd8f2d681049845d882094b99"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.8.5/postman-chinese-injector-macos-x64.tar.xz"
      sha256 "52a794d60041652b3e8ed7ae9ef6be0e214e9a29cd5ffccac24bcfa17f07727d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.8.5/postman-chinese-injector-linux-arm64.tar.xz"
      sha256 "d9aa51f71cdf5aaad7874836fefdf7e2a8a874b507f08cb4f7c752eaeaf6df30"
    end
    on_intel do
      url "https://github.com/hlmd/postman-chinese-injector/releases/download/v1.8.5/postman-chinese-injector-linux-x64.tar.xz"
      sha256 "ee99b8a948a8f5aeab219c98730c23a3d4736cd722342fb431431ae14269276a"
    end
  end

  def install
    binary = Dir["postman-chinese-injector-*"].first
    chmod 0755, binary
    bin.install binary => "postman-chinese-injector"
  end

  def caveats
    <<~EOS
      完全退出 Postman 后运行 `postman-chinese-injector` 注入汉化，`--restore` 还原。
      程序由 Homebrew 管理（已关闭自更新），升级请用：brew upgrade postman-chinese-injector
      Linux 上 Postman 装在 /opt 等系统目录时可能需要 sudo。
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/postman-chinese-injector --version")
  end
end
