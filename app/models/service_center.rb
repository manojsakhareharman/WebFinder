class ServiceCenter < ActiveRecord::Base

  validates :willingness, acceptance: true, on: :create
  validates :name, presence: true, uniqueness: true
  validates :contact_name, presence: true
  validates :email, presence: true
  validates :zip, presence: true

end
