class Author < ApplicationRecord
    has_many :books, dependent: :destroy, before_add: [:check_credit_limit]

    def check_credit_limit(book)
        puts "something fishy"
    end
end
