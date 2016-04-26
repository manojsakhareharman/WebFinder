ActiveAdmin.register MenuItem do
  menu parent: "Settings", name: "Resources Menu", priority: 5

  permit_params :title, :link, :position

  index do
    selectable_column
    id_column
    column :title
    column :link
    column :position
    column :locale
    actions
  end

  sidebar "Instructions" do
    "These links are used for customizing the 'Resources' menu only. Leave the locale blank when creating default menu items."
  end

  filter :locale
  filter :title

  form do |f|
    f.inputs do
      f.input :title, hint: "Link text"
      f.input :link
      f.input :new_tab
      f.input :position, hint: "Sorting order among other menu items of the same locale."
      f.input :locale, hint: "Leave blank when editing the default menu"
    end
    f.actions
  end

end
