# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Trapasm < Formula
  desc "TRAP Assembler for the ALICE TRD"
  homepage ""
  url "https://alicetrd.web.cern.ch/download/src/trapasm-0.6.tar.gz"
  sha256 "74d1f44d2f7624fe2f5e7286d369d8c21dd000335438f81b1862807b2bb1f0c7"
  license ""

  depends_on "fpc" => :build
  # depends_on "cmake" => :build

  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./configure", "--trapinc=/usr/local/share/trap/", "--trapdir=#{prefix}/share/trap/", *std_configure_args
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
