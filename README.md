Anyplayer
=========

[![Gem Version](https://badge.fury.io/rb/anyplayer.png)](http://badge.fury.io/rb/anyplayer)
[![Build Status](https://travis-ci.org/sunny/anyplayer.png)](https://travis-ci.org/sunny/anyplayer)

Interacts with the currently running music player.
Supports iTunes Mac, iTunes Windows, Spotify Mac, Rdio Mac, MPD, Rhythmbox, Amarok and XMMS2.

Install
-------

```sh
$ gem install anyplayer
```

Use it in your terminal
-----------------------

```sh
$ anyplayer artist     # artist of the current track
New Order
$ anyplayer track      # name of the current track
Blue Monday
$ anyplayer album
Power, Corruption & Lies
$ anyplayer next       # changes track forward
$ anyplayer prev       #               backward
$ anyplayer playpause  # pauses if it is playing, plays if it's paused
$ anyplayer play
$ anyplayer pause
$ anyplayer voldown    # put the volume somewhat up
$ anyplayer volup      #                         down
$ anyplayer volume     # prints the volume percentage
100
$ anyplayer vote       # votes to go to next song (default number of votes is 5)
$ anyplayer name
iTunes
$ anyplayer launched && echo "a player is running" || echo "nothing running"
a player is running
```

Or in Ruby
----------

```ruby
require 'anyplayer'
player = Anyplayer::Selector.new.player

player.launched? # => true
player.name # => Rythmbox
player.artist # => "The Avalanches"
player.track # => "Frontier Psychiatrist"
# …
```

Or in a browser
----------------

With the [So Nice](https://github.com/sunny/so-nice/) Web interface:

![So Nice Screenshot](https://github.com/sunny/so-nice/raw/gh-pages/screenshot.png)


Development
-----------

```sh
$ ruby -Ilib bin/anyplayer  # Use the anyplayer command-line from source
$ bundle exec rake test     # Launch tests
$ bundle exec rake install  # Install from source
$ bundle exec rake console  # Launch console
```

All contributions are welcome! Head to the [Github issues](https://github.com/sunny/anyplayer/issues) to report bugs, questions or code.

License
-------

MIT
