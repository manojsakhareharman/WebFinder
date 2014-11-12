class AddRetailFlagToExamples < ActiveRecord::Migration
  def change
    add_column :examples, :retail, :boolean, default: false
  end
end
