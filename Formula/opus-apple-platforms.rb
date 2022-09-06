class OpusApplePlatforms < Formula
  desc "Opus codec on Apple platforms"
  homepage "https://github.com/oliverepper/opus-apple-platforms"
  url "https://github.com/oliverepper/opus-apple-platforms.git", tag: '0.1'
  license "MIT"
  head "https://github.com/oliverepper/opus-apple-platforms.git", branch: "main"
  
  bottle do
    root_url 'https://github.com/oliverepper/opus-apple-platforms/releases/download/0.1'
    sha256 cellar: :any_skip_relocation, arm64_monterey: "5ae3f606cf48ac5a4f1904e23be022105675d8170aa0417313da91e4eed47de6"
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
