class LoginController < ApplicationController
  def index
    if !session[:player1]
      session[:player1] = false
    end
    if !session[:player2]
      session[:player2] = false
    end
  end
  def reg
    player = User.new(user_params)
    if player.valid? && params[:player] == 1
      player.save
      session[:player1] = player.id
    elsif player.valid? && params[:player] == 2
      player.save
      session[:player2] = player.id
    else
      flash[:error] = player.errors.full_messages
    end
    redirect_to '/'
  end
  def login
    player = User.find_by_pin(params[:pin])
    if params[:player] == 1
      if player
        session[:player1] = player.id
      end
    elsif params[:player] == 2
      if player
        session[:player2] = player.id
      end
    end
    redirect_to '/'
  end
  def reset
    if params[:player] == 1
      session[:player1] = false
    elsif params[:player] == 2
      session[:player2] = false
    end
    redirect_to '/'
  end

  private
  def user_params
    params.require(:player).permit(:first_name, :last_name, :email, :pin)
  end
end
