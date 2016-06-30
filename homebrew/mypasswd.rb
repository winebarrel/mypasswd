require 'formula'

class Mypasswd < Formula
  VERSION = '0.1.1'

  homepage 'https://github.com/winebarrel/mypasswd'
  url "https://github.com/winebarrel/mypasswd/archive/v0.1.1.tar.gz"
  sha256 '9ce48fcc3e0395de8e1b59bbea0542d853a9c2f4abac2b4da9e7202f929d1517'
  version VERSION
  head 'https://github.com/winebarrel/mypasswd.git', :branch => 'master'
  depends_on 'go' => :build

  def install
    system "make"
    bin.install 'mypasswd'
  end
end
