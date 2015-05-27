require "csv"
namespace :ss do

  # :nodoc:
  desc "Import Harman Pro service centers"
  task import: :environment do
    puts "This task was already run. It should not be run again. The end."
    # import
  end

  def import
    akg = Brand.find "akg"
    crown = Brand.find "crown"
    bss = Brand.find "bss"
    dbx = Brand.find "dbx"
    digitech = Brand.find "digitech"
    dod = Brand.find "dod"
    jbl = Brand.find "jbl-professional"
    lexicon = Brand.find "lexicon"
    martin = Brand.find "martin"
    soundcraft = Brand.find "soundcraft"

    ServiceCenter.delete_all
    ServiceCenterServiceGroup.delete_all
    ServiceGroup.delete_all

    puts "Total service centers before: #{ServiceCenter.all.count}"

    file = Rails.root.join("db", "service_centers.csv")

    CSV.open(file, 'r:ISO-8859-1').each do |row|
      service_center = ServiceCenter.where(name: row[1], account_number: row[0]).first_or_initialize
      service_center.contact_name ||= row[2]
      service_center.address ||= row[3]
      service_center.city ||= row[4]
      service_center.state ||= row[5]
      service_center.zip ||= row[6]
      service_center.phone ||= row[7]
      service_center.email ||= row[8]
      service_center.active = true
      puts "Saving... #{service_center.name }"

      if service_center.save(validate: false)
        if row[10].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "AKG", brand_id: akg.id).first_or_create
        end
        if row[11].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "Crown", brand_id: crown.id).first_or_create
        end
        if row[12].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "BSS", brand_id: bss.id).first_or_create
        end
        if row[13].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "dbx", brand_id: dbx.id).first_or_create
        end
        if row[14].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "DigiTech", brand_id: digitech.id).first_or_create
        end
        if row[15].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "DOD", brand_id: dod.id).first_or_create
        end
        if row[16].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "JBL PRO/Selenium: TRANSDUCERS, Non-Powered Systems", brand_id: jbl.id).first_or_create
        end
        if row[17].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "JBL PRO/Selenium: EON, LSR, Transducers, Non-Powered Systems", brand_id: jbl.id).first_or_create
        end
        if row[18].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "JBL PRO/Selenium: All Products, EXCEPT Vertec, VTX, VP, Drivepack", brand_id: jbl.id).first_or_create
        end
        if row[19].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "JBL PRO/Selenium: All Products", brand_id: jbl.id).first_or_create
        end
        if row[20].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "Lexicon", brand_id: lexicon.id).first_or_create
        end
        if row[21].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "Martin Lighting", brand_id: martin.id).first_or_create
        end
        if row[22].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "Soundcraft: All Products", brand_id: soundcraft.id).first_or_create
        end
        if row[23].to_s.match(/x/i)
          service_center.service_groups << ServiceGroup.where(name: "Soundcraft: Analog Consoles Only", brand_id: soundcraft.id).first_or_create
        end
        service_center.reload
        puts "   with #{ service_center.service_groups.length } service group"
      end
    end

    puts "Total service centers after: #{ServiceCenter.all.count}"

  end
  # :nodoc:
end
