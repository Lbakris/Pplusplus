class MatchesController < ApplicationController
  def start
    if session[:player1] && session[:player2]
      session[:start] = Time.now
      render 'matches/index'
    else
      flash[:error] = 'Two players must be logged in to start a match.'
      redirect_to '/'
    end
  end
  def end
    length = Time.now - session[:start]
    player1 = User.find(session[:player1])
    player2 = User.find(session[:player2])
    game = Match.new(player1: player1, player2: player2, winner: winner, score1: score1, score2: score2, length: length.to_i)
    game.save
    render 'matches/final'
  end
end
