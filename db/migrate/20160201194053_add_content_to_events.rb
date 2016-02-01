class AddContentToEvents < ActiveRecord::Migration
  def change
    add_column :events, :page_content, :text
    add_column :events, :more_info_link, :string
    add_column :events, :new_window, :boolean
  end
end
