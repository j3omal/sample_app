class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
<<<<<<< HEAD
  before_create :create_remember_token

=======
  before_create :create_remember_token	
>>>>>>> updating-users
  validates(:name, presence: true, length: { maximum: 50 })
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } 
  validates :password, length: { minimum: 6 }
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

<<<<<<< HEAD
  def User.hash(token)
=======
  def User.encrypt(token)
>>>>>>> updating-users
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
<<<<<<< HEAD
      self.remember_token = User.hash(User.new_remember_token)
    end
=======
      self.remember_token = User.encrypt(User.new_remember_token)
    end

>>>>>>> updating-users
end

