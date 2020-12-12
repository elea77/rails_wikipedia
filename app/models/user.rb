class User < ApplicationRecord

    # Hash password for security
    has_secure_password

    # Email and Username not null and unique
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true

end
