class User < ApplicationRecord

    validates :username, :password_digest, :session_token, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}

    after_initialize :ensure_session_token

    attr_reader :password

    def password=(password)
        # set inst. var @password to password
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        # takes in password input (string)
        # called on user instance
        # calls BCrypt::Password.new on self.password_digest
        # stores in variable
        # calls BCrypt method: .is_password?(password) on variable
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(username, password)
        # takes in username and password
        # called on User class (class method)
        # find user instance w/ matching username
        # checks if password is user instance's password
        # returns user instance
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end


end