class AddBannerToReferenceSystems < ActiveRecord::Migration
  def up
    add_attachment :reference_systems, :banner
  end

  def down
    remove_attachment :reference_systems, :banner
  end
end
