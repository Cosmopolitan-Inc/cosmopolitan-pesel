# frozen_string_literal: true

require_relative 'lib/cosmopolitan/pesel/version'

Gem::Specification.new do |spec|
  spec.name = 'cosmopolitan-pesel'
  spec.version = Cosmopolitan::Pesel::VERSION
  spec.authors = ['tomczak-mateusz']
  spec.email = ['mateusz.tomczak@sperasoft.com']

  spec.summary = 'Placeholder'
  spec.description = 'Placeholder'
  spec.homepage = 'https://placeholder.com'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.6'

  spec.metadata['allowed_push_host'] = 'Placeholder'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/tomczak-mateusz/cosmopolitan-pesel'
  spec.metadata['changelog_uri'] = 'https://github.com/tomczak-mateusz/cosmopolitan-pesel/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency 'example-gem', '~> 1.0'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
