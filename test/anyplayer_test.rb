require "test_helper"

class AnyplayerTest < Minitest::Test
  def test_loading_all_players_does_not_explode
    PLAYERS.each do |player|
      require "anyplayer/players/#{player}"
    end
  rescue LoadError
    # Allow LoadErrors that depend on Windows
  end

  def test_launched
    assert_kind_of Anyplayer::Player, Anyplayer.launched
  end
end
