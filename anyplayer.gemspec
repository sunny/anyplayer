# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "anyplayer/version"

Gem::Specification.new do |s|
  s.name        = "anyplayer"
  s.version     = Anyplayer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sunny Ripert", "Gordon Diggs"]
  s.email       = ["sunny@sunfox.org", "gordon@gordondiggs.com"]
  s.homepage    = "http://github.com/sunny/anyplayer"
  s.summary     = %q{Interact with the running music player}
  s.description = %q{Play/pause/skip songs in iTunes Mac, iTunes Windows, Spotify Mac, Rdio Mac, MPD, Rhythmbox, Amarok and XMMS2}
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'ruby-mpd', '~> 0.3.0'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'flexmock'
  s.add_development_dependency 'rake'
end
