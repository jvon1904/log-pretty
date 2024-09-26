# frozen_string_literal: true

require_relative 'log_pretty/version'
require_relative 'log_pretty/ansi_printer'

# Extend module for global access to #logp method
module LogPretty
  class Error < StandardError; end

  def logp(input, **opts)
    output = AnsiPrinter.new(input:, **opts).output

    $stdout.puts output.to_s
  end
end
