# frozen_string_literal: true

require 'test_helper'

class TestLogPretty < Minitest::Test
  include LogPretty

  def test_that_it_has_a_version_number
    refute_nil ::LogPretty::VERSION
  end

  def test_it_logs_to_stdout
    assert_output("\e[6m\e[49m\e[39mfoo\e[0m\n") { logp('foo') }
  end

  def test_it_logs_with_color
    assert_output("\e[6m\e[49m\e[34mI am blue!\e[0m\n") { logp('I am blue!', color: :blue) }
  end

  def test_it_logs_with_background
    assert_output("\e[6m\e[43m\e[36mI am cyan with yellow background!\e[0m\n") do
      logp('I am cyan with yellow background!', color: 'cyan', background: :yellow)
    end
  end

  def test_it_logs_with_single_format
    assert_output("\e[4m\e[49m\e[31mI am red and underlined!\e[0m\n") do
      logp('I am red and underlined!', color: :red, format: :underline)
    end
  end

  def test_it_logs_with_multiple_formats
    assert_output("\e[1m\e[3m\e[49m\e[39mI am bold and italic!\e[0m\n") do
      logp('I am bold and italic!', format: %i[bold italic])
    end
  end
end
