require 'formula'

class Mypasswd < Formula
  VERSION = '0.1.2'

  homepage 'https://github.com/winebarrel/mypasswd'
  url "https://github.com/winebarrel/mypasswd/archive/v0.1.2.tar.gz"
  sha256 '1e0eca8a18956fa4b5f48fbff33ba696e32783ea3711c4498d43074127a4160a'
  version VERSION
  head 'https://github.com/winebarrel/mypasswd.git', :branch => 'master'
  depends_on 'go' => :build

  def install
    system "make"
    bin.install 'mypasswd'
  end
end
