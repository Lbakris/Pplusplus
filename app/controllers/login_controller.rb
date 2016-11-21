class LoginController < ApplicationController
  def index
    if !session['id']
      session['id'] = 1
    end
    # session['id'] = 1
    if !session['id2']
      session['id2'] = 10
    end
  end
  def reg
    puts "Inside the reg method"
    session['id'] = 2
    redirect_to '/'
  end
  def reg2
    session['id2'] = 11
    puts "IN reg 2"
    redirect_to :back
  end
  def login
    session['id'] = 3
    puts "Inside the Login method"
    redirect_to '/'
  end
  def reset
    session['id'] = 1
    redirect_to :back
  end
  def rst2
    session['id2'] = 10
    redirect_to :back
  end
  def fight
    pin = User.find_by_pin(params[:pin])
    if pin
      puts "Found you"
    end
    redirect_to :back
  end
end
