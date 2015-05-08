class AddTrainingUrlToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :training_url, :string
  end
end
