namespace :translations do

  task fix: :environment do

    AvailableLocale.translatables.each do |t|
      t.constantize.all.each do |item|
        begin
          item.save
          item.translations.each {|tr| tr.save}
        rescue
          puts "Couldn't save #{ item.inspect }"
        end
      end
    end

  end

end
