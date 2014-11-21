class AddBannerToReferenceSystems < ActiveRecord::Migration
  def up
    add_attachment :reference_systems, :banner
  end

  def method_name
    remove_attachment :reference_systems, :banner
  end
end
