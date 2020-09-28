# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Test", password: "test")
Agency.create(name: "Atlas", bio: "Looking for talent", agency_type: "Staffing")

Job.create(title: "Software Architect", employer: "Google", location: "San Francisco, CA", description: "Write code", release_date: Date.new, job_type: "Full Time", user_id: 1, agency_id: 1)
Job.create(title: "Project Manager", employer: "IBM", location: "Seattle, WA", description: "Write code", release_date: Date.new, job_type: "Full Time", user_id: 1, agency_id: 1)
Job.create(title: "Front End Developer", employer: "Nintendo", location: "New York, NY", description: "Write code", release_date: Date.new, job_type: "Full Time", user_id: 1, agency_id: 1)
Job.create(title: "Full Stack Developer", employer: "Oracle", location: "Miami, FL", description: "Write code", release_date: Date.new, job_type: "Full Time", user_id: 1, agency_id: 1)
Job.create(title: "Back End Developer", employer: "Microsoft", location: "Atlanta, GA", description: "Write code", release_date: Date.new, job_type: "Full Time", user_id: 1, agency_id: 1)

