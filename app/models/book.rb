class Book < ApplicationRecord
    belongs_to :my_csv
    validates_uniqueness_of :isbn, on: :create, message: "must be unique"
end
