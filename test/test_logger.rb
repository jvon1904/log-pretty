# frozen_string_literal: true

require 'test_helper'

class TestLogPretty < Minitest::Test
  include LogPretty
  LOG_FILE = File.expand_path('log_pretty.log', __dir__)

  def setup
    File.truncate(LOG_FILE, 0)
    @logger = LogPretty::Logger.new(LOG_FILE)

    formatter = ->(_s, _t, _p, m) { "__#{m}__" }
    @logger_with_format = LogPretty::Logger.new(LOG_FILE, formatter)
  end

  def test_it_logs_to_file
    @logger.logp('asdf')
    content = File.read(LOG_FILE)

    assert_equal("\e[6m\e[49m\e[39masdf\e[0m\n", content)
  end

  def test_it_logs_to_file_with_format
    @logger_with_format.logp('asdf')
    content = File.read(LOG_FILE)

    assert_equal("__\e[6m\e[49m\e[39masdf\e[0m__", content)
  end
end
