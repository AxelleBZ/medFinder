class Medication < ApplicationRecord
  has_many :medications_ingredients
  has_many :ingredients, through: :medications_ingredients

  include PgSearch
  pg_search_scope :search_by_medication_and_ingredients,
    # against: [:local_name, :english_name ],
    associated_against: {
      ingredients: [:name]

    }
    # using: {
    #   tsearch: { prefix: true } # <-- now `superman batm` will return something!
    # }
end
