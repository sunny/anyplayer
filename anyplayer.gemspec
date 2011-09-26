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
  s.description = %q{Play/pause/skip songs in iTunes, Rythmbox, MPD, XMMS}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
