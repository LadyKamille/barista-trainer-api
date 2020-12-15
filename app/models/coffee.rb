class Coffee < ApplicationRecord
  belongs_to :roast
  belongs_to :grind
  belongs_to :tasting_notes
end
