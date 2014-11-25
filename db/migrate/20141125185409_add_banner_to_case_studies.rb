class AddBannerToCaseStudies < ActiveRecord::Migration
  def up
    add_attachment :case_studies, :banner
  end

  def down
    remove_attachment :case_studies, :banner
  end
end
