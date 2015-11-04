class Resource < ActiveRecord::Base
  acts_as_taggable

  has_attached_file :attachment,
    url: '/system/:class/:attachment/:id_:timestamp/:basename.:extension',
    path: ":rails_root/public/system/:class/:attachment/:id_:timestamp/:basename.:extension"
  do_not_validate_attachment_file_type :attachment

end
