require "test_helper"
require "ruby-mpd"
require "anyplayer/players/mpd"

class MpdTest < Minitest::Test
  include FlexMock::TestCase

  def setup
    @mpd_instance_mock = flexmock("mpd")
    flexmock(MPD, "MPD", :new => @mpd_instance_mock)
  end

  def test_uses_ruby_mpd_gem
    @mpd_instance_mock.should_receive :connect
    Mpd.new
  end

  def test_works_around_toggle_bug
    player = Mpd.new
    @mpd_instance_mock.should_receive(:paused?).once.and_return(false)
    @mpd_instance_mock.should_receive(:send_command).with(:pause).once

    player.playpause
  end
end
