class PjprojectApplePlatforms < Formula
  desc "PJSIP project on Apple platforms"
  homepage "https://github.com/oliverepper/pjproject-apple-platforms"
  url "https://github.com/oliverepper/pjproject-apple-platforms/archive/refs/tags/0.2.tar.gz"
  sha256 "aa67a227fa4e9c932f527cc98a0fe0c66aedceff732af3397ad87d3209779a8e"
  license "MIT"

  bottle do
    root_url 'https://github.com/oliverepper/pjproject-apple-platforms/releases/download/0.2'
    sha256 cellar: :any_skip_relocation, arm64_monterey: "b561bac0f257d0078354976ef576c21bfcbc11d8ea6546074883f60bf094ae8a"
    sha256 cellar: :any_skip_relocation, monterey: "b561bac0f257d0078354976ef576c21bfcbc11d8ea6546074883f60bf094ae8a"
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
