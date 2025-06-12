# frozen_string_literal: true

require 'logger'

# Extend module for global access to #logp method
module LogPretty
  # Initialize a custom logger if setting the device or formatter
  class Logger
    def initialize(log_device = nil, formatter = nil, **_opts)
      @log_device = log_device || $stdout
      @formatter = formatter || default_formatter
    end

    # Will print to custom loggin device, if other than STDOUT,
    # STDOUT by default, and returns output
    def logp(input, **)
      output = AnsiPrinter.new(input:, **).output

      # print to logger
      logger.info(output)

      # print to $stdout unless it already is.
      $stdout.puts(output) unless logger.instance_variable_get(:@logdev).dev == $stdout

      # return value
      output
    end

    private

    def logger
      @logger ||= ::Logger.new(@log_device).tap do |l|
        l.formatter = @formatter
      end
    end

    def default_formatter
      proc do |_severity, _datetime, _progname, message|
        "#{message}\n"
      end
    end
  end
end
