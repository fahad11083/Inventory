class  Person
    include ActiveModel::AttributeMethods, ActiveModel::Conversion, ActiveModel::Dirty, ActiveModel::Model, ActiveModel::Serializers::JSON, ActiveModel::SecurePassword
    extend ActiveModel::Callbacks 

    has_secure_password
    has_secure_password :recovery_password, validations: false

    define_model_callbacks :update

    before_update :reset_me

    attribute_method_prefix 'reset_'
    attribute_method_suffix '_highest?'
    define_attribute_methods 'age', 'dob', 'first_name', 'last_name'
 
    attr_accessor :age, :dob, :first_name, :last_name, :password_digest, :recovery_password_digest

    validates :first_name, presence:true
    
    def attributes=(hash)
      hash.each do |key, value|
        send("#{key}=", value)
      end
    end

    def attributes
      { 'first_name' => nil, 'last_name' => nil }
    end

    def first_name
      @first_name
    end

    def first_name=(value)
      first_name_will_change!
      @first_name = value
    end

    def last_name
      @last_name
    end

    def last_name=(value)
      @last_name = value
    end

    def save
      changes_applied
    end

    def persisted?
      false
    end 

    def id
      nil
    end

    def update(attribute)
      run_callbacks(:update) do
         puts "update is called"
      end
    end

    def reset_me
      puts "reset is called"
    end
    
    def deliver
      if valid?
        puts "email is delivered"
      end
    end

    def to_s
      puts "this is override method"
    end
    private
      def reset_attribute(attribute)
        send("#{attribute}=", 0)
      end
 
      def attribute_highest?(attribute)
        send(attribute) > 100
      end
end