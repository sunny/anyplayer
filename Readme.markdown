Anyplayer
=========

Interacts with the currently running music player. Supports iTunes OS X, iTunes Windows, Rythmbox, MPD & XMMS.

Install
-------

    $ gem install anyplayer

Use
---

    $ anyplayer artist     # artist of the current track
    New Order
    $ anyplayer track      # name of the current track
    Blue Monday
    $ anyplayer album
    Power, Corruption & Lies
    $ anyplayer next       # changes track forward
    $ anyplayer prev       #               backward
    $ anyplayer playpause  # pauses if it is playing, plays if it's paused
    $ anyplayer voldown    # put the volume somewhat up
    $ anyplayer volup      #                         down
    $ anyplayer volume     # prints the volume percentage
    100

As a Ruby library
-----------------

    require 'anyplayer'
    player = Anyplayer::launched

    player.name # => Rythmbox
    player.artist # => "The Avalanches"
    player.track # => "Frontier Psychiatrist"
    # …
