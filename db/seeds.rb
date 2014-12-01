# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

VerticalMarket.create(name: "Installed", headline: "Installed Audio, Video & Control Systems")
VerticalMarket.create(name: "Live Sound", headline: "Live Sound Solutions for Any Size")
VerticalMarket.create(name: "Studio", headline: "From Home Studio To Professional Studio")

vm_install = VerticalMarket.where(name: "Installed").first
VerticalMarket.create([
  {parent_id: vm_install.id, name: "House of Worship", headline: "House of Worship Audio, Lighting & Control Systems"},
  {parent_id: vm_install.id, name: "Restaurant/Bar", headline: "Restaurant/Bar Audio, Video and Control Systems"},
  {parent_id: vm_install.id, name: "Education", headline: "Audio/Video Solutions for Education Systems"},
  {parent_id: vm_install.id, name: "Hospitality", headline: "Audio/Video Solutions for Hospitality Systems"},
  {parent_id: vm_install.id, name: "Nightclubs", headline: "Nightclub Audio/Video/Lightin & Control Systems"},
  {parent_id: vm_install.id, name: "Office Spaces", headline: "Audio/Video/Control Systems for the Office"},
  {parent_id: vm_install.id, name: "Retail", headline: "Audio/Video/Lighting/Control for Retail"},
  {parent_id: vm_install.id, name: "Sports Venues", headline: "Audio/Video/Lighting and Control for Sports Venues"},
  {parent_id: vm_install.id, name: "Transportation", headline: "Audio/Video/Lighting and Control for Transportation"},
])

SiteSetting.create([
  { name: "homepage-main-headline", content: "Homepage Main Headline" },
  { name: "homepage-vertical-markets-headline", content: "Vertical Markets Headline" },
  { name: "resource-library-sidebar-title", content: "From The Harman Resource Library" },
  { name: "hef-sidebar-title", content: "Harman Equipment Financing" },
  { name: "hef-description", content: "Description of Harman Equipment Financing" },
  { name: "subheader-help-find-installer", content: "Need help locating an AV Consultant or System Installer?" },
  { name: "help-find-installer-description", content: "Paragraph describing how we can help find a consultant or installer." },
  { name: "button-help-find-installer", content: "Help Me Find An Installer" }
])
