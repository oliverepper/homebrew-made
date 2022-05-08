class PjprojectApplePlatforms < Formula
  desc "PJSIP project on Apple platforms"
  homepage "https://github.com/oliverepper/pjproject-apple-platforms"
  url "https://github.com/oliverepper/pjproject-apple-platforms/archive/refs/tags/0.4.tar.gz"
  sha256 "dec68fce1893a4e26c29ab9a1de6a5a6bbbfc13da04ee846b60bc6d1bb76f3f3"
  license "MIT"

  bottle do
    root_url 'https://github.com/oliverepper/pjproject-apple-platforms/releases/download/0.4'
    sha256 cellar: :any_skip_relocation, arm64_monterey: "addd9dbc6bf8047112f17b841d6861c208ec2454b5c052a5c001da68fcb6a6af"
    sha256 cellar: :any_skip_relocation, monterey: "addd9dbc6bf8047112f17b841d6861c208ec2454b5c052a5c001da68fcb6a6af"
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
