# typed: false
# frozen_string_literal: true

class Taskr < Formula
  desc "Task runner / simpler Make alternative written in Go (forked version)"
  homepage "https://github.com/vikbert/taskr"
  url "https://github.com/vikbert/taskr/archive/refs/tags/v3.47.6.tar.gz"
  sha256 "e584bc62f14e2af82be659e2e18ef338e61aa96beb6c7a06e9cb34cf4987d301"
  license "MIT"
  head "https://github.com/vikbert/taskr.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w", "-o", bin/"taskr", "."
  end

  test do
    system "#{bin}/taskr", "--help"
  end
end
