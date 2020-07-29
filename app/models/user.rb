class User < ApplicationRecord     
    has_many :shipping_addresses, dependent: :destroy
    accepts_nested_attributes_for :shipping_addresses, allow_destroy: true
    
    validates :name, uniqueness: { case_sensitive: false }, presence: true
    validates :agreement, acceptance: { message: 'must be checked' }
    validates :email, confirmation: { case_sensitive: false },
    format: { with: /\A(.+)@(.+)\z/, message: " '%{value}' with invalid format"},
    uniqueness: { case_senstive: false }, length: { minimum: 4, maximum: 254 }
    validates :email_confirmation, presence: true
    
    before_create UserCallbacks.new
    before_validation :normalize_name, on: :create
    after_touch :log_when_association_got_hit
    after_create :send_email_to_author, if: :author_wants_emails?
    after_initialize do |user|
        puts "You have initialized an object!"
    end
    after_find do |user|
        puts "You have found an object!"
    end

    private
    def normalize_name
        self.name.downcase!
    end

    def log_when_association_got_hit
        puts "Association being hit"
    end

    def author_wants_emails?
        true
    end

    def send_email_to_author
        puts 'Email Sent'
    end

end
