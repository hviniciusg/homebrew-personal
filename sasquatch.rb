class Sasquatch < Formula
  homepage "https://github.com/devttys0/sasquatch"
  head "https://github.com/devttys0/sasquatch.git"

  depends_on "lzo"
  depends_on "xz"

  # Add compatibility with Mac OS X and the BSDs
  # https://github.com/plougher/squashfs-tools/pull/3
  patch :p2 do
    url "https://github.com/plougher/squashfs-tools/pull/3.diff"
    sha1 "80a7fb24730042bfd95c9fe41e66d05094277770"
  end

  def install
    inreplace "xz_wrapper.c", "<lzma.h>", "\"#{HOMEBREW_PREFIX}/include/lzma.h\""
    system "make"
    bin.install "sasquatch"
  end
end
