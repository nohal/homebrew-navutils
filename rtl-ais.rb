class RtlAis < Formula
  desc "Simple AIS tuner and generic dual-frequency FM demodulator"
  homepage "https://github.com/dgiardini/rtl-ais"
  url "https://github.com/nohal/rtl-ais/archive/v0.1.20160414.tar.gz"
  sha256 "610cc0f602c65f5044cf2be3f5372313b535e0d199425cd98b9a430f41a5bf3c"

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
