Anyplayer
=========

Ruby library to interact with the running music player (iTunes, Rythmbox, MPD, XMMS).

    $ gem install anyplayer
    $ anyplayer track
    Sunglasses at Night
    $ anyplayer next
    $ anyplayer track
    Rock the Casbah

As a library:

    require 'anyplayer'
    player = Anyplayer::launched
    player.name # => Rythmbox
    player.track # => "Frontier Psychiatrist"
    player.next
    player.track # => "Ready For The Floor"

