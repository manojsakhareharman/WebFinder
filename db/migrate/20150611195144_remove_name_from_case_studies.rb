class RemoveNameFromCaseStudies < ActiveRecord::Migration
  def change
    remove_column :case_studies, :name, :string
  end
end
