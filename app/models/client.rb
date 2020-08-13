class Client < ApplicationRecord
  has_one :address
  has_many :orders, -> { order('id DESC') }
  has_and_belongs_to_many :roles

  #scope :named, -> { where(name: "fahad") if name.present? }
  #default_scope { where(name: "fahad") }
  #enum name: [:available, :unavailable]
end
