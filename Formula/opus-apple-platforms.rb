class OpusApplePlatforms < Formula
  desc "Opus codec on Apple platforms"
  homepage "https://github.com/oliverepper/opus-apple-platforms"
  url "https://github.com/oliverepper/opus-apple-platforms.git", tag: '0.1.1'
  license "MIT"
  head "https://github.com/oliverepper/opus-apple-platforms.git", branch: "main"
  
  bottle do
    root_url 'https://github.com/oliverepper/opus-apple-platforms/releases/download/0.1.1'
    sha256 cellar: :any, arm64_monterey: "0a38d1af6fdb0b51fae6c4f01d5bfa5a8ad2fe9e75fcc9991291a2ced74333f8"
  end

  depends_on "autoconf" => [:build]
  depends_on "automake" => [:build]
  depends_on "libtool" => [:build]
  depends_on "gawk" => [:build]
  depends_on :xcode

  def install
    ENV.deparallelize # IMPORTANT!
    # there might be a better way
    ENV["CC"] = "/usr/bin/clang"
    ENV["CXX"] = "/usr/bin/clang++"
    system "sh", "start.sh"
    system "sh", ".install.sh", prefix.to_s
  end

  test do
    # for now
    system "true"
  end
end
