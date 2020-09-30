class User < ApplicationRecord
    has_many :jobs
    has_many :agencies, through: :jobs

    has_secure_password
    
    #Validations
    validates :name, presence: true
    validates :password, presence: true
end
