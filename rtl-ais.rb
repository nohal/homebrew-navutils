class RtlAis < Formula
  desc "Simple AIS tuner and generic dual-frequency FM demodulator"
  homepage "https://github.com/dgiardini/rtl-ais"
  url "https://github.com/nohal/rtl-ais/archive/refs/tags/v0.3.20240112.tar.gz"
  sha256 "95884a326202fe0f98e8578b12cae13bc31b332d31e649106ebdb1e1888a2337"

  depends_on "librtlsdr"
  depends_on "libusb"

  def install
    system "make", "all"
    bin.install "rtl_ais"
  end

  test do
    system "#{bin}/rtl_ais"
  end
end
