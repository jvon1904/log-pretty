# frozen_string_literal: true

require_relative 'log-pretty/version'
require_relative 'log-pretty/ansi_printer'

# Extend module for global access to #logp method
module LogPretty
  class Error < StandardError; end

  def logp(input, **opts)
    output = AnsiPrinter.new(input:, **opts).output

    # Print to STDOUT
    $stdout.puts output

    # Return value
    output
  end
end
