class PjprojectApplePlatforms < Formula
  desc "PJSIP project on Apple platforms"
  homepage "https://github.com/oliverepper/pjproject-apple-platforms"
  url "https://github.com/oliverepper/pjproject-apple-platforms.git", tag: '0.6.1'
  license "MIT"
  head "https://github.com/oliverepper/pjproject-apple-platforms.git", branch: "main"
  # sha256 "6084cf12da5a97475375d281d0ecd96bb745a48b9aa61a23f7064da9262e60da"


  bottle do
    root_url 'https://github.com/oliverepper/pjproject-apple-platforms/releases/download/0.6.1'
    sha256 cellar: :any_skip_relocation, arm64_monterey: "4a7fc3b64344bc6d3c8251fb5e175e5380a1d757c30527fe40d47cb0901159ff"
    sha256 cellar: :any_skip_relocation, monterey: "4a7fc3b64344bc6d3c8251fb5e175e5380a1d757c30527fe40d47cb0901159ff"
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
