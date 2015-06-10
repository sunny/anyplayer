# Default Player class that is inherrited by all players.
#
# All players should override these methods:
#   launched? (return bool)
#   next
#   prev
#   play
#   pause
#   playpause
#   track     (return string)
#   artist    (return string)
#   album     (return string)
#   voldown
#   volup
#   volume    (return int)
#   playing?  (return bool)
#   paused?   (return bool)
class Anyplayer::Player
  DEFAULT_VOTES_TO_SKIP = 5

  def initialize
    @votes = 0
  end

  # Return true if the player is currently launched
  def launched?
    false
  end

  # Player name defaults to the classe's, feel free to override it
  # Example:
  #     player.name # => iTunes
  def name
    self.class.to_s.gsub(/^.*::/, '')
  end

  # Default paused is not playing
  def paused?
    !playing?
  end

  # Tells the player to toggle the pause state
  def playpause
    paused? ? play : pause
  end

  # Vote to skip this song
  def vote(votes_to_skip = DEFAULT_VOTES_TO_SKIP)
    @votes += 1
    if @votes >= votes_to_skip
      self.next
      reset_votes
    end
  end

  # Returns the number of votes to skip this song
  def votes
    @votes
  end

  # Tell the player to go the the next song
  # This resets the votes, so be sure to call super in children
  def next
    reset_votes
  end

  # Tell the player to go to the previous song
  # This resets the votes, so be sur eto call super in children
  def prev
    reset_votes
  end

  # Operating systems where this player should work
  def platforms
    [:mac, :windows, :linux, :unix]
  end


  private

  def reset_votes
    @votes = 0
  end

end

