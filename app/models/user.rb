class User < ActiveRecord::Base
  has_many :player1s, :class_name => "Match"
  has_many :player2s, :class_name => "Match"
  has_many :winners, :class_name => "Match"
  
  has_secure_password
end
