class GamesController < ApplicationController
  before_filter :init

  def init
    @start_time = Time.now
  end

  def game
    alphabet = ('A'..'Z').to_a
    @grid = []
    10.times { @grid << alphabet.sample }
    p @grid
    return @grid
  end

  def score
    @start_time = DateTime.parse(params[:start_time]).to_time
    @end_time = Time.now
    @total_time = (@end_time - @start_time).fdiv(1000)
    @attempt = params[:guess]
    if check_guess
      @total_time > 100 ? @score_time = 0 : @score_time = (100 - @total_time).fdiv(10)
      @score_clone = @attempt.length + @score_time
      @result = {score: @score_clone, message: "well done", time: @total_time }
    else
      @result = {score: 0, message: "not in the grid", time: @total_time }
    end
  end

  def check_guess
    @grid = params[:grid].split(";")
    p @grid
    array_attempt = params[:guess].upcase.chars
    grid_clone = @grid.dup

    array_attempt.each do |char|
      if grid_clone.include?(char)
        grid_clone.delete_at(grid_clone.index(char))
      else
        return false
      end
    end

    return true
  end

end
