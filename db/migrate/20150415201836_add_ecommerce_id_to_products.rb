class AddEcommerceIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ecommerce_id, :string
  end
end
