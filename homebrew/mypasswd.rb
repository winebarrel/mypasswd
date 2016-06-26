require 'formula'

class Mypasswd < Formula
  VERSION = '0.1.0'

  homepage 'https://github.com/winebarrel/mypasswd'
  url "https://github.com/winebarrel/mypasswd/releases/download/v#{VERSION}/mypasswd-v#{VERSION}-darwin-amd64.gz"
  sha256 'eb22e65b4cc0b79112f968418f3254b456c6704135cfea62bce6b9fc2fe44496'
  version VERSION
  head 'https://github.com/winebarrel/mypasswd.git', :branch => 'master'

  def install
    system "mv mypasswd-v#{VERSION}-darwin-amd64 mypasswd"
    bin.install 'mypasswd'
  end
end
