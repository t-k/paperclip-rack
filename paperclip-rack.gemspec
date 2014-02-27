# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip/rack/version'

Gem::Specification.new do |spec|
  spec.name          = "paperclip-rack"
  spec.version       = Paperclip::Rack::VERSION
  spec.authors       = ["Tatsuo Kaniwa"]
  spec.email         = ["tatsuo@kaniwa.biz"]
  spec.description   = %q{Enable paperclip file upload on Non-Rails rack application such as Sinatra}
  spec.summary       = %q{Enable paperclip file upload on Non-Rails rack application}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency("paperclip", ">= 3.0")

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "shoulda"
  spec.add_development_dependency "rack"
end
