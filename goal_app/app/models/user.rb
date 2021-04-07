class User < ApplicationRecord

    after_initialize :ensure_session_token

    attr_reader :password

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        # set inst. var @password to password
        @password = password
    end

    def is_password?(password)

    end

    def self.find_by_credentials(username, password)
    end

    def ensure_session_token
        # 
        self.session_token ||= SecureRandom.urlsafe_base64
    end

    def reset_session_token!
        # self.session_token = SecureRandom.urlsafe_base64
        # self.save!
        # self.session_token
    end


end