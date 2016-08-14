class RtlAis < Formula
  desc "Simple AIS tuner and generic dual-frequency FM demodulator"
  homepage "https://github.com/dgiardini/rtl-ais"
  url "https://github.com/nohal/rtl-ais/archive/v0.1.20160814.tar.gz"
  sha256 "ce646f97c921ff106639d8ed79b7b46ecbbf790fb32b975bfcb4c4790a3a0b0f"

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
