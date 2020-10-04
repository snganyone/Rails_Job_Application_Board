class Job < ApplicationRecord
    belongs_to :user
    belongs_to :agency
    
    validates :title, presence: true
    validates :employer, presence: true
    validates :location, presence: true
    validates :description, length: { maximum: 500 }
    validates :release_date, presence: true
    validates :job_type, presence: true

    #Job Scope
    def self.search(query)
        Job.where('title LIKE ?', "%#{query}%")
    end
end
