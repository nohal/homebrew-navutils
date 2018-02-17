class Libbsb < Formula
  desc "Tools to manipulate nautical charts in KAP format"
  homepage "http://libbsb.sourceforge.net"
  url "https://github.com/nohal/libbsb/archive/v0.0.8.tar.gz"
  sha256 "570a2e2e1ffbb03e000a9e3a873bdc567f961253fdd759628cc8e540870db979"

  depends_on "libtiff"
  depends_on "libpng"

  def install
    system "./configure", "CC=gcc"
    system "make", "all"
    bin.install "bsbfix", "bsb2png", "bsb2ppm", "bsb2tif", "ppm2bsb", "tif2bsb"
  end

  test do
    system "#{bin}/bsbfix"
  end
end
