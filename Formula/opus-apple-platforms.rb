class OpusApplePlatforms < Formula
  desc "Opus codec on Apple platforms"
  homepage "https://github.com/oliverepper/opus-apple-platforms"
  url "https://github.com/oliverepper/opus-apple-platforms.git", tag: '0.2.1'
  license "MIT"
  head "https://github.com/oliverepper/opus-apple-platforms.git", branch: "main"
  
  bottle do
    root_url 'https://github.com/oliverepper/opus-apple-platforms/releases/download/0.2.1'
    sha256 cellar: :any, arm64_monterey: "125152734696daba0d2559f314b7c1179f89cd22bdebc6202b2bd1079d2614ed"
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
    system "sh", "start.sh", prefix.to_s
  end

  test do
    # for now
    system "true"
  end
end
