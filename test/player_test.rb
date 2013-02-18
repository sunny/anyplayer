require "test_helper"

class PlayerTest < MiniTest::Unit::TestCase
  include FlexMock::TestCase

  def setup
    @player = Noplayer.new
  end

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
