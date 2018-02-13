class Imgkap < Formula
  desc "Tool to create nautical charts in KAP format."
  homepage "https://github.com/nohal/imgkap"
  url "https://github.com/nohal/imgkap/archive/v1.15.tar.gz"
  sha256 "a9db2e8d76e59438e07dccb8c68bfe165f40af7c5ed1a7162268961762b64bed"

  depends_on "freeimage"

  def install
    system "make", "imgkap"
    bin.install "imgkap"
    pkgshare.install "examples"
  end

  test do
    system "#{bin}/imgkap", "#{pkgshare}/examples/PWAE10.gif", 45, -95, "139;250", 25, -45, "1532;938", "natl.kap"
    assert File.exist?("natl.kap")
  end
end
