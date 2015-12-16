# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create([
  { name: 'rails', owner: 'rails', repo: 'rails' },
  { name: 'rake', owner: 'ruby', repo: 'rake' },
  { name: 'rack', owner: 'rack', repo: 'rack' },
  { name: 'sass', owner: 'sass', repo: 'sass' },
  { name: 'haml', owner: 'haml', repo: 'haml' },
])
