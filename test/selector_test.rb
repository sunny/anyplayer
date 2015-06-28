require "test_helper"

class AnyplayerTest < Minitest::Test
  def test_player
    selector = Selector.new
    player = selector.player
    assert_kind_of Player, player
  end

  def test_verbose_accessor
    selector = Selector.new
    assert !selector.verbose

    selector.verbose = true
    assert selector.verbose
  end

  def test_verbose_flag_messages
    selector = Selector.new
    selector.verbose = true

    assert_output nil, "noplayer:\n  loaded\n  launched\n" do
      selector.player
    end
  end
end
