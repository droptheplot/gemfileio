# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

frameworks = Category.create(title: 'Frameworks')
templates = Category.create(title: 'Templates')
assets = Category.create(title: 'Assets')

Project.create([
  { name: 'rails', owner: 'rails', repo: 'rails', category_id: frameworks.id, active: true },
  { name: 'rake', owner: 'ruby', repo: 'rake', category_id: frameworks.id, active: true },
  { name: 'rack', owner: 'rack', repo: 'rack', category_id: frameworks.id, active: true },
  { name: 'haml', owner: 'haml', repo: 'haml', category_id: templates.id, active: true },
  { name: 'sass', owner: 'sass', repo: 'sass', category_id: assets.id, active: true },
])
