class Imgkap < Formula
  desc "Tool to create nautical charts in KAP format."
  homepage "https://github.com/nohal/imgkap"
  url "https://github.com/nohal/imgkap/archive/v1.16.tar.gz"
  sha256 "38a9c3c267459088f7471dff2710a047aa6711a1c80fb442c854faa1151ae5d5"

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
