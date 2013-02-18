require "test_helper"

class AnyplayerTest < MiniTest::Unit::TestCase
  def test_deprecated_launched
    assert_output nil, "Anyplayer.launched is deprecated: please initialize a new Selector and call player\n" do
      deprecated_player = Anyplayer::launched
      assert_kind_of Player, deprecated_player
    end
  end

  # def test_loading_all_players
  #   PLAYERS.each do |player|
  #     require "anyplayer/players/#{player}"
  #   end
  # end
end
