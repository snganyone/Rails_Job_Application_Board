class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :employer
      t.string :location
      t.string :description
      t.date :release_date
      t.string :job_type
      t.integer :user_id

      t.timestamps
    end
  end
end
