class Libbsb < Formula
  desc "Tools to manipulate nautical charts in KAP format"
  homepage "http://libbsb.sourceforge.net"
  url "https://github.com/nohal/libbsb/archive/v0.0.7.tar.gz"
  sha256 "efe0ce89bf1ffd6371125bafba32333bcd0d002e72b6614583ca4dbdda48e56e"

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
