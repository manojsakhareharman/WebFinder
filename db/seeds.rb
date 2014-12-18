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
  { name: "hef-description", content: "Our flexible finance programs and unbeatable rates make it easy for you to get the equipment you really want and need." },
  { name: "subheader-help-find-installer", content: "Need help locating an AV Consultant or System Installer?" },
  { name: "help-find-installer-description", content: "We've worked with the top system consultants and installers throughout the world. Let us help you get connected with a partner who is right for your project." },
  { name: "button-help-find-installer", content: "Help Me Find An Installer" },
  { name: "hef-link", content: "http://www.harmanequipmentfinance.com" }
])

Brand.create([
  { name: "AKG", url: "http://www.akg.com" },
  { name: "AMX", url: "http://www.amx.com" },
  { name: "BSS", url: "http://www.bssaudio.com" },
  { name: "Crown", url: "http://www.crownaudio.com" },
  { name: "dbx", url: "http://www.dbxpro.com" },
  { name: "JBL", url: "http://www.jblpro.com" },
  { name: "Lexicon", url: "http://www.lexiconpro.com" },
  { name: "Martin", url: "http://www.martin.com" },
  { name: "Soundcraft", url: "http://www.soundcraft.com" },
  { name: "Studer", url: "http://www.studer.ch" },
])

ProductType.create([
  { name: "Microphone" },
  { name: "Mixer" },
  { name: "Signal Processor" },
  { name: "Amplifier" },
  { name: "Powered Speaker" },
  { name: "Speaker" },
  { name: "Control Interface" }
])
