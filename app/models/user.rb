class User < ApplicationRecord
  def authenticated?(password)
    return false if password_digest.nil?
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.digest(password)
    BCrypt::Password.create(password)
  end

  def self.new_token
    SecureRandom::urlsafe_base64
  end
    
  def self.from_omniauth(auth)
    if user == User.find_by(email: auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    else
      user = User.new
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
    user.save!
  end
end
