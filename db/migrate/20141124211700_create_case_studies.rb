class CreateCaseStudies < ActiveRecord::Migration
  def change
    create_table :case_studies do |t|
      t.string :name
      t.string :headline
      t.text :description
      t.integer :vertical_market_id

      t.timestamps
    end
    add_index :case_studies, :vertical_market_id
  end
end
