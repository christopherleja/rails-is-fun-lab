class Author < ApplicationRecord
    has_many :book_authors
    has_many :books, through: :book_authors,dependent: :destroy
    validates :name, presence: true
    validates :birth_year, presence: true, numericality: true


end

