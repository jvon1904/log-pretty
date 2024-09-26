# frozen_string_literal: true

# Receives a Sting of input and options that will translate to ANSI escape codes
class AnsiPrinter
  attr_reader :input

  def initialize(input:, **opts)
    opts.transform_keys!(&:to_sym)

    @input = input
    @color = opts[:color]
    @background = opts[:background]
    @formats = opts[:format]
  end

  def color_code
    case @color
    when :black, 'black'
      30
    when :red, 'red'
      31
    when :green, 'green'
      32
    when :yellow, 'yellow'
      33
    when :blue, 'blue'
      34
    when :magenta, :purple, 'magenta', 'purple'
      35
    when :cyan, :teal, 'cyan', 'teal'
      36
    when :white, 'white'
      37
    else
      39
    end
  end

  def background_code
    case @background
    when :black, 'black'
      40
    when :red, 'red'
      41
    when :green, 'green'
      42
    when :yellow, 'yellow'
      43
    when :blue, 'blue'
      44
    when :magenta, :purple, 'magenta', 'purple'
      45
    when :cyan, :teal, 'cyan', 'teal'
      46
    when :white, 'white'
      47
    else
      49
    end
  end

  def format_codes
    [@formats].flatten.map do |fmt|
      format_code(fmt)
    end
  end

  def format_code(fmt)
    case fmt
    when :bold, 'bold'
      1
    when :dim, :faint, 'dim', 'faint'
      2
    when :italic, 'italic'
      3
    when :underline, :underscore, 'underline', 'underscore'
      4
    when :blink, :blinking, 'blink', 'blinking'
      5
    when :inverse, :reverse, 'inverse', 'reverse'
      7
    when :hidden, :invisible, 'hidden', 'invisible'
      8
    when :strikethrough, 'strikethrough'
      9
    else
      6
    end
  end

  def output
    formatted_output + reset
  end

  def escape(code)
    "\e[#{code}m"
  end

  def escapes(codes)
    codes.map { |c| escape(c) }.join
  end

  def reset
    "\e[0m"
  end

  def formatted_output
    escapes(format_codes) + background_output
  end

  def background_output
    escape(background_code) + colored_output
  end

  def colored_output
    escape(color_code) + input
  end
end
