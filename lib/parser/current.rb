# frozen_string_literal: true

module Parser
  class << self
    def warn_syntax_deviation(feature, version)
      unless ENV['SUPPRESS_PERSER_WARNING']
        warn "warning: parser/current is loading #{feature}, which recognizes"
        warn "warning: #{version}-compliant syntax, but you are running #{RUBY_VERSION}."
        warn "warning: please see https://github.com/whitequark/parser#compatibility-with-ruby-mri."
      end
    end
    private :warn_syntax_deviation
  end

  case RUBY_VERSION
  when /^2\.0\./
    current_version = '2.0.0'
    if RUBY_VERSION != current_version
      warn_syntax_deviation 'parser/ruby20', current_version
    end

    require 'parser/ruby20'
    CurrentRuby = Ruby20

  when /^2\.1\./
    current_version = '2.1.10'
    if RUBY_VERSION != current_version
      warn_syntax_deviation 'parser/ruby21', current_version
    end

    require 'parser/ruby21'
    CurrentRuby = Ruby21

  when /^2\.2\./
    current_version = '2.2.9'
    if RUBY_VERSION != current_version
      warn_syntax_deviation 'parser/ruby22', current_version
    end

    require 'parser/ruby22'
    CurrentRuby = Ruby22

  when /^2\.3\./
    current_version = '2.3.6'
    if RUBY_VERSION != current_version
      warn_syntax_deviation 'parser/ruby23', current_version
    end

    require 'parser/ruby23'
    CurrentRuby = Ruby23

  when /^2\.4\./
    current_version = '2.4.3'
    if RUBY_VERSION != current_version
      warn_syntax_deviation 'parser/ruby24', current_version
    end

    require 'parser/ruby24'
    CurrentRuby = Ruby24

  when /^2\.5\./
    current_version = '2.5.0'
    if RUBY_VERSION != current_version
      warn_syntax_deviation 'parser/ruby25', current_version
    end

    require 'parser/ruby25'
    CurrentRuby = Ruby25

  else # :nocov:
    # Keep this in sync with released Ruby.
    warn_syntax_deviation 'parser/ruby25', '2.5.x'
    require 'parser/ruby25'
    CurrentRuby = Ruby25
  end
end
