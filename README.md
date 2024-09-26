# LogPretty

LogPretty adds functionaltiy to print to STDOUT using [ANSI escape](https://en.wikipedia.org/wiki/ANSI_escape_code) colors and formatting.

You can echo the following to any ANSI-compatible terminal to see blue output.

```bash
$ echo "\e[34mHello world!\e[0m"
```

The '34' is the code for blue and the '0' at the end resets all styles.  You can find a helpful list of ANSI codes [here](https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797).

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
$ bundle add log-pretty
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
$ gem install log-pretty
```

Then, if you would like to use the `#logp` method as a top-level method, inlude the `LogPretty` module.

In Rails, this can be done by adding fild `config/initializers/log_pretty.rb' with the following content.

```ruby
include LogPretty
```

## Usage

The main method `#logp` (which stands for 'log pretty') logs pretty content (colors, formatting, etc.) to standard output.  This can be useful for writing scrips and CLIs where you would like the user to see prettier content in their terminal.

Supply a String argument for the content and any optional formatting arguments.

For instance, if I wanted to log "Red alert!" to the terminal in red, underlined text, I would invoke `#logp` like this.

```ruby
logp('Red alert!', color: :red, format: :underline)
```

Or, if I wanted multiple formats, I can supply an array.

```ruby
logp('Red alert!', color: :red, format: %i[underline bold italic])
```

Avaliable optional keys are:
- color
- background
- format

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LogPretty project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jvon1904/log-pretty/blob/main/CODE_OF_CONDUCT.md).
