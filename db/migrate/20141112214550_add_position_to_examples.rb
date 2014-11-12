class AddPositionToExamples < ActiveRecord::Migration
  def change
    add_column :examples, :position, :integer
  end
end
