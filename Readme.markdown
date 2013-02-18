Anyplayer
=========

Interacts with the currently running music player. Supports iTunes OS X, iTunes Windows,
Rythmbox, MPD & XMMS2.

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

Depending on your configuration you may need to add `bundle exec` to the following commands.

Terminal binary from source:

```sh
$ ruby -Ilib bin/anyplayer
```

Tests:

```sh
$ rake test
```

Install from source:

```sh
$ rake install
```
