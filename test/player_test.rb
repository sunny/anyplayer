require "test_helper"

class PlayerTest < Minitest::Test
  def setup
    @player = Noplayer.new
  end

  # Default name

  def test_default_name
    assert_equal "Noplayer", @player.name
  end

  def test_default_name_should_remove_namespace
    flexmock(@player).should_receive(:class).and_return("Foo::Bar")
    assert_equal "Bar", @player.name
  end

  # Default paused?

  def test_paused_is_false_if_not_playing
    flexmock(@player).should_receive(:playing?).once.and_return(false)
    assert @player.paused?
  end

  def test_paused_is_true_if_not_paused
    flexmock(@player).should_receive(:playing?).once.and_return(true)
    assert !@player.paused?
  end

  # Default playpause

  def test_playpause_toggles_play
    flexmock(@player).should_receive(:paused?).once.and_return(true)
    flexmock(@player).should_receive(:play).once

    @player.playpause
  end

  def test_playpause_toggles_pause
    flexmock(@player).should_receive(:paused?).once.and_return(false)
    flexmock(@player).should_receive(:pause).once

    @player.playpause
  end

  # Votes

  def test_votes
    Player::DEFAULT_VOTES_TO_SKIP.times do |i|
      @player.vote

      # votes should be 0 if we've voted enough times
      if i == Player::DEFAULT_VOTES_TO_SKIP - 1
        assert_equal @player.votes, 0
      else
        assert_equal @player.votes, i + 1
      end
    end
  end

  def test_voting_changes_track
    flexmock(@player).should_receive(:next).once
    Player::DEFAULT_VOTES_TO_SKIP.times { @player.vote }
  end

  def test_vote_resets
    assert_equal @player.votes, 0

    @player.vote
    @player.next
    assert_equal @player.votes, 0

    @player.vote
    @player.prev
    assert_equal @player.votes, 0
  end

  def test_custom_voting_quota
    10.times do |i|
      @player.vote(10)

      if i == 9
        assert_equal @player.votes, 0
      else
        assert_equal @player.votes, i + 1
      end
    end
  end
end
