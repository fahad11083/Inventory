class User < ApplicationRecord     
    has_many :shipping_addresses, dependent: :destroy
    accepts_nested_attributes_for :shipping_addresses
    
    validates :name, uniqueness: true, presence: true
    before_validation :normalize_name, on: :create
    
    private
    def normalize_name
        self.name.downcase!
    end
end
