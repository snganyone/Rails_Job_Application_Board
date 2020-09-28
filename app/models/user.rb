class User < ApplicationRecord
    has_many :jobs
    has_many :jobs, through: :agencies
    has_secure_password
end
