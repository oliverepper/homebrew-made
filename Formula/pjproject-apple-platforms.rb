class PjprojectApplePlatforms < Formula
  desc "PJSIP project on Apple platforms"
  homepage "https://github.com/oliverepper/pjproject-apple-platforms"
  url "https://github.com/oliverepper/pjproject-apple-platforms/archive/refs/tags/0.3.tar.gz"
  sha256 "b44cd5fccdffc6760fca42a2d0e6f12d12482a9cd6b645c77cb363869f6c4220"
  license "MIT"

  bottle do
    root_url 'https://github.com/oliverepper/pjproject-apple-platforms/releases/download/0.3'
    sha256 cellar: :any_skip_relocation, arm64_monterey: "9644915dfa9d382067992bf8b973a8042c1f203d187554517b9fd473bda93854"
    sha256 cellar: :any_skip_relocation, monterey: "9644915dfa9d382067992bf8b973a8042c1f203d187554517b9fd473bda93854"
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
