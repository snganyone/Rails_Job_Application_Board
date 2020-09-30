class Agency < ApplicationRecord
    has_many :jobs
    has_many :users, through: :jobs

    #Validations
    validates :name, presence: true

end
