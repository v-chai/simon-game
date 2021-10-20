
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.5
      system("clear")
    end
  end

  def require_sequence
    test_seq = @sequence.dup
    while test_seq.length > 0
      guess = gets.chomp
      if guess != test_seq.shift
        @game_over = true
        return @game_over
      end
    end

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You got it!"
  end

  def game_over_message
    puts "Err! You got the sequence wrong"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
