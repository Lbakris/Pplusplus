class StatsController < ApplicationController
  def user
    @user = User.find(params[:id])
    matches1 = Match.where(player1: @user)
    matches2 = Match.where(player2: @user)
    @matches = matches1 + matches2
    @avgscore = (matches1.average(:score1) + matches2.average(:score2)) / 2
    @avgopponent = (matches1.average(:score2) + matches2.average(:score1)) / 2
    @scorediff = @avgscore - @avgopponent
    wonmatches = Match.where(winner: @user)
    wonmatches1 = wonmatches.where(player1: @user)
    wonmatches2 = wonmatches.where(player2: @user)
    @windiff = (wonmatches1.average(:score1) + wonmatches2.average(:score2)) / 2
  end
  def show

  end
end
