class Agency < ApplicationRecord
    has_many :jobs
    has_many :users, through: :jobs

    #Validations
    validates_presence_of :name, presence: true
    validates_presence_of :agency_type, presence: true

end
