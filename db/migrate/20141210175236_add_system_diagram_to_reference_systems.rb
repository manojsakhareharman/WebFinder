class AddSystemDiagramToReferenceSystems < ActiveRecord::Migration
  def change
    add_attachment :reference_systems, :system_diagram
  end
end
