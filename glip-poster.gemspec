lib = 'glip-poster'
lib_file = File.expand_path("../lib/#{lib}/poster.rb", __FILE__)
File.read(lib_file) =~ /\bVERSION\s*=\s*["'](.+?)["']/
version = $1

Gem::Specification.new do |s|
  s.name        = 'glip-poster'
  s.version     = version
  s.date        = '2016-01-31'
  s.summary     = 'Glip Poster - Ruby SDK for post messages via Glip webhooks'
  s.description = 'A Ruby SDK for post messages via Glip webhooks'
  s.authors     = ['John Wang']
  s.email       = 'johncwang@gmail.com'
  s.homepage    = 'https://github.com/grokify/'
  s.licenses    = ['MIT']
  s.files       = Dir['lib/**/**/*'] # + Dir['bin/*']
  s.files      += Dir['[A-Z]*']    + Dir['test/**/*']
  # s.files.reject! { |fn| fn.include? "CVS" }
  # s.required_ruby_version = '>= 1.8.7' # 1.8.7+ is tested
  s.add_dependency 'faraday', '~> 0.9', '>= 0.9'
  s.add_dependency 'faraday_middleware', '~> 0', '>= 0'
end
