class User < ApplicationRecord
    has_many :jobs
    has_many :agencies, through: :jobs

    has_secure_password

    #Validations
    validates :name, presence: true
    validates :password, presence: true
    validates :bio, length: { maximum: 500 }

    #Scope
    scope :admin, -> {where(admin: true)}

    #Google Omniauth
    def self.from_omniauth(auth)
        find_or_create_by(name: auth[:info][:name]) do |user|
            #Randomized Password
            user.password = SecureRandom.hex(15)
        end
    end

end
