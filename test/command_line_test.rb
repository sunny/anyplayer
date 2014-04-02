require "test_helper"
require "anyplayer/command_line"

class CommandLineTest < Minitest::Test
  include FlexMock::TestCase

  USAGE = "Usage: anyplayer [-v] [command]

Where command is one of: playpause, play, pause, next, prev, voldown, volup, volume, track, artist, album, vote, name, launched, paused, playing.

Player connected: Fake Player.
"

  def setup
    @player = flexmock(:player)
    @selector = flexmock(:selector)
    @selector.should_receive(:player).and_return(@player)
    flexmock(Anyplayer::Selector).should_receive(:new).and_return(@selector)
  end


  def test_no_command
    flexmock(@player).should_receive(:name).once.and_return("Fake Player")
    flexmock($stderr).should_receive(:puts).once.with(USAGE)
    flexmock(Anyplayer::CommandLine).should_receive(:exit).once.with(1)
    Anyplayer::CommandLine.parse(%w())
  end

  def test_wrong_command
    flexmock(@player).should_receive(:name).once.and_return("Fake Player")
    flexmock($stderr).should_receive(:puts).once.with(USAGE)
    flexmock(Anyplayer::CommandLine).should_receive(:exit).once.with(1)
    Anyplayer::CommandLine.parse(%w(err))
  end

  # Actions

  def test_playpause
    flexmock(@player).should_receive(:playpause).once
    Anyplayer::CommandLine.parse(%w(playpause))
  end

  def test_play
    flexmock(@player).should_receive(:play).once
    Anyplayer::CommandLine.parse(%w(play))
  end

  def test_pause
    flexmock(@player).should_receive(:pause).once
    Anyplayer::CommandLine.parse(%w(pause))
  end

  def test_next
    flexmock(@player).should_receive(:next).once
    Anyplayer::CommandLine.parse(%w(next))
  end

  def test_prev
    flexmock(@player).should_receive(:prev).once
    Anyplayer::CommandLine.parse(%w(prev))
  end

  def test_voldown
    flexmock(@player).should_receive(:voldown).once
    Anyplayer::CommandLine.parse(%w(voldown))
  end

  def test_volup
    flexmock(@player).should_receive(:volup).once
    Anyplayer::CommandLine.parse(%w(volup))
  end

  def test_vote
    flexmock(@player).should_receive(:vote).once
    Anyplayer::CommandLine.parse(%w(vote))
  end

  def test_volume
    flexmock(@player).should_receive(:volume).once.and_return(42)
    flexmock($stdout).should_receive(:puts).once.with(42)
    Anyplayer::CommandLine.parse(%w(volume))
  end

  def test_track
    flexmock(@player).should_receive(:track).once.and_return("Foo")
    flexmock($stdout).should_receive(:puts).once.with("Foo")
    Anyplayer::CommandLine.parse(%w(track))
  end

  def test_artist
    flexmock(@player).should_receive(:artist).once.and_return("Foo")
    flexmock($stdout).should_receive(:puts).once.with("Foo")
    Anyplayer::CommandLine.parse(%w(artist))
  end

  def test_album
    flexmock(@player).should_receive(:album).once.and_return("Foo")
    flexmock($stdout).should_receive(:puts).once.with("Foo")
    Anyplayer::CommandLine.parse(%w(album))
  end

  def test_name
    flexmock(@player).should_receive(:name).once.and_return("Foo")
    flexmock($stdout).should_receive(:puts).once.with("Foo")
    Anyplayer::CommandLine.parse(%w(name))
  end


  # Booleans

  def test_launched_true
    flexmock(Anyplayer::CommandLine).should_receive(:exit)#.with(1)
    flexmock(@player).should_receive(:launched?).once.and_return(true)
    Anyplayer::CommandLine.parse(%w(launched))
  end
  def test_launched_false
    flexmock(Anyplayer::CommandLine).should_receive(:exit)#.with(0)
    flexmock(@player).should_receive(:launched?).once.and_return(false)
    Anyplayer::CommandLine.parse(%w(launched))
  end

  def test_playing_true
    flexmock(Anyplayer::CommandLine).should_receive(:exit).once#.with(1)
    flexmock(@player).should_receive(:playing?).once.and_return(true)
    Anyplayer::CommandLine.parse(%w(playing))
  end
  def test_playing_false
    flexmock(Anyplayer::CommandLine).should_receive(:exit).once#.with(0)
    flexmock(@player).should_receive(:playing?).once.and_return(false)
    Anyplayer::CommandLine.parse(%w(playing))
  end

  def test_paused_true
    flexmock(Anyplayer::CommandLine).should_receive(:exit).once#.with(1)
    flexmock(@player).should_receive(:paused?).once.and_return(true)
    Anyplayer::CommandLine.parse(%w(paused))
  end
  def test_paused_false
    flexmock(Anyplayer::CommandLine).should_receive(:exit).once#.with(0)
    flexmock(@player).should_receive(:paused?).once.and_return(false)
    Anyplayer::CommandLine.parse(%w(paused))
  end
end
