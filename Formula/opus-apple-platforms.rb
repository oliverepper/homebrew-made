class OpusApplePlatforms < Formula
  desc "Opus codec on Apple platforms"
  homepage "https://github.com/oliverepper/opus-apple-platforms"
  url "https://github.com/oliverepper/opus-apple-platforms.git", tag: '0.3'
  license "MIT"
  head "https://github.com/oliverepper/opus-apple-platforms.git", branch: "main"
  
  bottle do
    root_url 'https://github.com/oliverepper/opus-apple-platforms/releases/download/0.3'
    sha256 cellar: :any, arm64_monterey: "5cd1a345f3b9de011a365ff3ac80506255bfeb756633b62efbd4930fbcc26b4b"
  end

  depends_on "cmake" => [:build]
  depends_on :xcode

  conflicts_with "opus", because: "both install the same libraries and headers"

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
