class Job < ApplicationRecord
    belongs_to :user
    belongs_to :agency
    
    validates :title, presence: true#, message: "Please enter a job title"
    validates :employer, presence: true
    validates :location, presence: true
    validates :description, length: { maximum: 500 }
    validates :release_date, presence: true
    validates :job_type, presence: true

end
