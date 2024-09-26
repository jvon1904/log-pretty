# frozen_string_literal: true

require_relative 'lib/log-pretty/version'

Gem::Specification.new do |spec|
  spec.name = 'log-pretty'
  spec.version = LogPretty::VERSION
  spec.authors = ['Jesse vonBergen']
  spec.email = ['jvon1904@gmail.com']

  spec.summary = spec.description = 'Provides intuitive methods for outputting ANSI escaped content to the terminal'
  spec.homepage = 'https://github.com/jvon1904/log-pretty'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.3.0'

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.metadata = {
    'rubygems_mfa_required' => 'true',
    'homepage_uri' => spec.homepage,
    'source_code_uri' => spec.homepage
  }
end
