# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vm_install = VerticalMarket.create(name: "Installed")
VerticalMarket.create(name: "Live Sound")
VerticalMarket.create(name: "Studio")

VerticalMarket.create([
  {parent_id: vm_install.id, name: "House of Worship"},
  {parent_id: vm_install.id, name: "Restaurant/Bar"},
#  {parent_id: vm_install.id, name: ""},
#  {parent_id: vm_install.id, name: ""},
#  {parent_id: vm_install.id, name: ""},
#  {parent_id: vm_install.id, name: ""},
#  {parent_id: vm_install.id, name: ""},
#  {parent_id: vm_install.id, name: ""},
#  {parent_id: vm_install.id, name: ""},
#  {parent_id: vm_install.id, name: ""},
#  {parent_id: vm_install.id, name: ""},
])
