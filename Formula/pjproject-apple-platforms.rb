class PjprojectApplePlatforms < Formula
  desc "PJSIP project on Apple platforms"
  homepage "https://github.com/oliverepper/pjproject-apple-platforms"
  url "https://github.com/oliverepper/pjproject-apple-platforms.git", tag: '0.9'
  license "MIT"
  head "https://github.com/oliverepper/pjproject-apple-platforms.git", branch: "main"

  bottle do
    root_url 'https://github.com/oliverepper/pjproject-apple-platforms/releases/download/0.9'
    sha256 cellar: :any_skip_relocation, arm64_monterey: "0c92b7d29f03ea6a0b3dcdb3c056a239ea9005a7ce4d42b10ff6a01477f97c74"
  end

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
