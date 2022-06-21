class PjprojectApplePlatforms < Formula
  desc "PJSIP project on Apple platforms"
  homepage "https://github.com/oliverepper/pjproject-apple-platforms"
  url "https://github.com/oliverepper/pjproject-apple-platforms.git", tag: 0.6
  license "MIT"
  head "https://github.com/oliverepper/pjproject-apple-platforms.git", branch: "main"
  # sha256 "6084cf12da5a97475375d281d0ecd96bb745a48b9aa61a23f7064da9262e60da"

  bottle do
    root_url 'https://github.com/oliverepper/pjproject-apple-platforms/releases/download/0.6'
    sha256 cellar: :any_skip_relocation, arm64_monterey: "2484eeba66b8f0364afe1a5a8b5bf5180a1a36afd2673611f2d180228bc61626"
    sha256 cellar: :any_skip_relocation, monterey: "2484eeba66b8f0364afe1a5a8b5bf5180a1a36afd2673611f2d180228bc61626"
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
