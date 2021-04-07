class User < ApplicationRecord


    attr_reader :password

    def password=(password)
    end

    def is_password(password)
    end

    def self.find_by_cridentials(username, password)
    end

    def ensure_session_token
    end

    def reset_session_token!
    end

    


end