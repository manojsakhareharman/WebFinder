class CreateServiceCenters < ActiveRecord::Migration
  def change
    create_table :service_centers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :fax
      t.string :email
      t.string :website
      t.string :account_number

      t.timestamps null: false
    end
  end
end
