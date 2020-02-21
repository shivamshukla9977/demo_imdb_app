require 'digest'

class User < ApplicationRecord

  #before_save :encrypt_password
  
	has_one :review

	# validates :email, presence: true, uniqueness: true
	# validates :password_enc, confirmation: true, length: { minimum: 6 }, presence: true
 #  validates :name, length: { minimum: 2 }

  def enc(string)
    Digest::MD5.hexdigest string   
  end
 
  def password
    password_enc
  end

  def authenticate?(authentication_password)
    password == enc(authentication_password)
  end

  def password=(authentication_password)
    self.password_enc = enc(authentication_password)
  end
  
  def password!(authentication_password)
    self.password = authentication_password
    save!
  end

  # private 

  # def encrypt_password
  #   self.password_enc = enc(password_enc)
  # end
end
