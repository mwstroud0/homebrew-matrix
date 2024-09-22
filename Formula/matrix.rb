class Matrix < Formula
  desc "A Matrix-like rain effect written in Python with ChatGPT"
  homepage "https://github.com/mwstroud0/matrix"
  url "https://github.com/mwstroud0/matrix/releases/download/v1.0/matrix-rain-1.0.tar.gz"
  sha256 "b9706900eb4a5be4f2a1a20374a1f8e35bc8d8ac0dbe00debd174e429573523a"

  depends_on "python@3.10"

  def install
    bin.install "matrix"
    prefix.install "matrix.py"

    (bin/"matrix").write <<~EOS
      #!/bin/bash
      python3 #{prefix}/matrix.py
    EOS
  end

  test do
    system "#{bin}/matrix", "--version"
  end
end