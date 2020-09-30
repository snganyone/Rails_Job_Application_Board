class Agency < ApplicationRecord
    has_many :jobs
    has_many :users, through: :jobs

    #Validations
    validates :name, presence: true
    validates :bio, length: { maximum: 500 }

end
