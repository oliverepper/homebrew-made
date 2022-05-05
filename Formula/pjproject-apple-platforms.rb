class PjprojectApplePlatforms < Formula
  desc "PJSIP project on Apple platforms"
  homepage "https://github.com/oliverepper/pjproject-apple-platforms"
  url "https://github.com/oliverepper/pjproject-apple-platforms/archive/refs/tags/0.1.tar.gz"
  sha256 "53338006ce703fb39d286cbe95d55b1bdf79ac8671389dbdc7628a8966e3cced"
  license "MIT"

  bottle do
    root_url 'https://github.com/oliverepper/pjproject-apple-platforms/releases/download/0.1'
    sha256 cellar: :any_skip_relocation, arm64_monterey: "dc848e983f7e474ec9abe061aef5671e82f7dab38a0cf67caf3beeefbd2a25d1"
  end

  def install
    ENV.deparallelize # IMPORTANT!
    # there might be a better way
    ENV["CC"] = "/usr/bin/clang"
    ENV["CXX"] = "/usr/bin/clang++"
    system "sh", "start.sh"
    system "sh", "install.sh", prefix.to_s
  end

  test do
    # for now
    system "true"
  end
end
