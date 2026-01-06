# typed: false
# frozen_string_literal: true

class Taskr < Formula
  desc "Task runner / simpler Make alternative written in Go (forked version)"
  homepage "https://github.com/vikbert/taskr"
  url "https://github.com/vikbert/taskr/archive/refs/tags/v3.47.7.tar.gz"
  sha256 "20705d89f0aae70b7927661e44c9130bc8d66e59366c7caea92174bf68dd0d31"
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
