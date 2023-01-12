class PjprojectApplePlatforms < Formula
  desc "PJSIP project on Apple platforms"
  homepage "https://github.com/oliverepper/pjproject-apple-platforms"
  url "https://github.com/oliverepper/pjproject-apple-platforms.git", tag: '0.10.3'
  license "MIT"
  head "https://github.com/oliverepper/pjproject-apple-platforms.git", branch: "main"

  bottle do
    root_url 'https://github.com/oliverepper/pjproject-apple-platforms/releases/download/0.10.3'
    sha256 cellar: :any_skip_relocation, arm64_ventura: "1b3a0f75e0fcb8ccc457a2569c04089d1ecf7004d4f79eb5f0d30e7c11889942"
  end

  depends_on "cmake" => [:build]
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
