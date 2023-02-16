class PjprojectApplePlatforms < Formula
  desc "PJSIP project on Apple platforms"
  homepage "https://github.com/oliverepper/pjproject-apple-platforms"
  url "https://github.com/oliverepper/pjproject-apple-platforms.git", tag: '0.10.5'
  license "MIT"
  head "https://github.com/oliverepper/pjproject-apple-platforms.git", branch: "main"

  bottle do
    root_url 'https://github.com/oliverepper/pjproject-apple-platforms/releases/download/0.10.5'
    sha256 cellar: :any_skip_relocation, arm64_ventura: "9b640aeb5f034c20ef3098f86022617230e110511268893e37f386f3e44ca126"
  end

  depends_on "cmake" => [:build]
  depends_on "llvm" => [:build]
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
