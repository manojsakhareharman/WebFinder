class CreateBrandsService
  def call
    crown = Brand.where(name: "Crown").first_or_initialize
    crown.url = "http://www.crownuadio.com"
    crown.tech_url = "http://crownaudio.sharesrvr.com"
    crown.save!

    jbl = Brand.where(name: "JBL").first_or_initialize
    jbl.name = "JBL Professional"
    jbl.url = "http://www.jblpro.com"
    jbl.tech_url = "http://jblproservice.com"
    jbl.save!

    selenium = Brand.where(name: "Selenium").first_or_initialize
    selenium.url = "http://www.jblselenium.com.br"
    selenium.show_on_main_site = false
    selenium.save!

    axys = Brand.where(name: "Axys").first_or_initialize
    axys.url = "http://www.duran-audio.com"
    axys.show_on_main_site = false
    axys.save!

    bss = Brand.where(name: "BSS").first_or_initialize
    bss.url = "http://bssaudio.com"
    bss.tech_url = "http://tech.bssaudious.com"
    bss.save!

    lexicon = Brand.where(name: "Lexicon").first_or_initialize
    lexicon.url = "http://lexiconpro.com"
    lexicon.tech_url = "http://tech.lexiconpro.com"
    lexicon.save!

    dbx = Brand.where(name: "dbx").first_or_initialize
    dbx.url = "http://dbxpro.com"
    dbx.tech_url = "http://tech.dbxpro.com"
    dbx.save!

    digitech = Brand.where(name: "DigiTech").first_or_initialize
    digitech.url = "http://digitech.com"
    digitech.tech_url = "http://tech.digitech.com"
    digitech.save!

    dod = Brand.where(name: "DOD").first_or_initialize
    dod.url = "http://dod.com"
    dod.tech_url = "http://tech.dod.com"
    dod.show_on_main_site = false
    dod.save!

    akg = Brand.where(name: "AKG").first_or_initialize
    akg.url = "http://www.akg.com/pro"
    akg.save!

    amx = Brand.where(name: "AMX").first_or_initialize
    amx.url = "http://www.amx.com"
    amx.save!

    martin = Brand.where(name: "Martin").first_or_initialize
    martin.url = "http://www.martin.com"
    martin.tech_url = "http://www.martinpro.com"
    martin.save!

    soundcraft = Brand.where(name: "Soundcraft").first_or_initialize
    soundcraft.url = "http://www.soundcraft.com"
    soundcraft.save!

    studer = Brand.where(name: "Studer").first_or_initialize
    studer.url = "http://www.studer.ch"
    studer.save!

  end
end
