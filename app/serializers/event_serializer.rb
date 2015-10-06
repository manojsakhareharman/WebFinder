class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_on, :end_on, :description, :featured, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :active
end
