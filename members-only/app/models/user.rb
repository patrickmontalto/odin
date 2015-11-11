class User < ActiveRecord::Base
	before_create :assign_token
	validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  									uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 5}
	has_many :posts

	def User.create_token
		token = SecureRandom.urlsafe_base64
		digested_token = User.digest(token)
	end

	def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

	private

		def assign_token
			self.remember_token = User.create_token
		end
end
