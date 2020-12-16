class Coffee < ApplicationRecord
  belongs_to :roast
  belongs_to :grind
  has_many :tasting_notes
end
