class User
	include Mongoid::Document
	field :username, type: String
	field :password, type: String

	validates :username, :length => {:minimum => 2}
	validates :username, :password, :presence => true
	validates :username, :uniqueness => true

	has_many :comments
	has_many :posts

	def self.authenticate(_username, _password)
		if _username == "" or _password == ""
			return false
		else
			user = User.find_by username: _username 
			user2 = User.find_by password: _password

			if user == user2
				return user
			else
				return false
			end
		end
	end 
	
end
