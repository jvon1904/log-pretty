# frozen_string_literal: true

require 'pry'
# frozen_string_literal: true

require_relative 'log-pretty/version'
require_relative 'log-pretty/ansi_printer'
require_relative 'log-pretty/logger'

# Extend module for global access to #logp method
module LogPretty
  class Error < StandardError; end

  # Stylize output simply with:
  # import LogPretty
  # logp('Hello, world! 👋', color: :teal, background: :blue, format: :bold)
  #
  # Or, set a custom log device and formatter:
  #
  # formatter = proc do |severity, datetime, progname, msg|
  #   "...#{msg}"
  # end
  #
  # logger = LogPretty::Logger.new("pretty.log", formatter)
  # logger.logp('Hello, world! 👋', color: red)
  #
  def logp(input, **)
    Logger.new.logp(input, **)
  end
end
