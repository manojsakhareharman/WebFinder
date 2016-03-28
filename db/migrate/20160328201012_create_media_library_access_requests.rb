class CreateMediaLibraryAccessRequests < ActiveRecord::Migration
  def change
    create_table :media_library_access_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :relationship
      t.string :employee_csu
      t.string :employee_office
      t.string :job_title
      t.string :region
      t.string :other_relationship

      t.timestamps null: false
    end
  end
end
