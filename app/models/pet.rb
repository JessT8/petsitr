class Pet < ApplicationRecord
    has_and_belongs_to_many :sitter
end