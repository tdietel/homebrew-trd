# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Trapasm < Formula
  desc "TRAP Assembler for the ALICE TRD"
  homepage ""
  url "https://alicetrd.web.cern.ch/download/src/trapasm-0.5.1.tar.gz"
  sha256 "a628762f843ffe93435a4fb941e0137552e21ee800166afb4a5113045a955dce"
  license ""

  depends_on "fpc" => :build
  # depends_on "cmake" => :build

  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./configure", "--trapinc=/usr/local/share/trapcc/", "--trapdir=#{prefix}/share/trapcc/", *std_configure_args
    system "make"
    system "make", "install"
    # system "cmake", ".", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test trapasm`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
