Anyplayer
=========

Ruby library to interact with the running music player (iTunes, Rythmbox, MPD, XMMS).

    require 'anyplayer'
    player = Anyplayer::launched
    player.name # => Rythmbox
    player.track # => "Frontier Psychiatrist"
    player.next
    player.track # => "Ready For The Floor"

