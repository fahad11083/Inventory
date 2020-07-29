class ActiveValidator < ActiveModel::Validator
    def validate(record)
        if record.city == "mexico"
            record.errors[:base] << "This Person belongs to Breaking Bad For Sure"
        end
    end
end