require "test_helper"
require "ruby-mpd"
require "anyplayer/players/mpd"

class MpdTest < MiniTest::Unit::TestCase
  include FlexMock::TestCase

  def setup
    @mpd_instance_mock = flexmock("mpd")
    flexmock(MPD, "MPD", :new => @mpd_instance_mock)
    @foo = "foobarbaz"
  end

  def test_has_instance_var
    assert_equal @foo, "foobarbaz"
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
