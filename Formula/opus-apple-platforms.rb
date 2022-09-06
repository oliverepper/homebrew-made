class OpusApplePlatforms < Formula
  desc "Opus codec on Apple platforms"
  homepage "https://github.com/oliverepper/opus-apple-platforms"
  url "https://github.com/oliverepper/opus-apple-platforms.git", tag: '0.1'
  license "MIT"
  head "https://github.com/oliverepper/opus-apple-platforms.git", branch: "main"
  
  bottle do
    root_url 'https://github.com/oliverepper/opus-apple-platforms/releases/download/0.1'
    sha256 cellar: :any_skip_relocation, arm64_monterey: "af2383f9457e180c68ebbc7e5136a461c55aa0aa1bb43f9a09c3620f4d01c76a"
  end
    
  depends_on "autoconf" => [:build]
  depends_on "automake" => [:build]
  depends_on "libtool" => [:build]

  def install
    # ENV.deparallelize # IMPORTANT!
    # # there might be a better way
    # ENV["CC"] = "/usr/bin/clang"
    # ENV["CXX"] = "/usr/bin/clang++"
    system "sh", "start.sh"
    system "sh", ".install.sh", prefix.to_s
  end

  test do
    # for now
    system "true"
  end
end
