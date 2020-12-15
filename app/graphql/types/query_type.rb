module Types
  class QueryType < Types::BaseObject
    # Coffee
    field :coffees, [Types:: CoffeeType], null: false

    def coffees
      Coffee.all
    end

    field :coffee, Types::CoffeeType, null: false do
      argument :id, ID, required: true
    end

    def coffee(id:)
      Coffee.find(id)
    end

    # Roasts
    field :roasts, [Types:: RoastType], null: false

    def roasts
      Roast.all
    end

    field :roast, Types::RoastType, null: false do
      argument :id, ID, required: true
    end

    def roast(id:)
      Roast.find(id)
    end

    # Grinds
    field :grinds, [Types:: GrindType], null: false

    def grinds
      Grind.all
    end

    field :grind, Types::GrindType, null: false do
      argument :id, ID, required: true
    end

    def grind(id:)
      Grind.find(id)
    end

    # Tasting Notes
    field :tasting_notes, [Types::TastingNoteType], null: false

    def tasting_notes
      TastingNote.all
    end

    field :tasting_note, Types::TastingNoteType, null: false do
      argument :id, ID, required: true
    end

    def tasting_note(id:)
      TastingNote.find(id)
    end
  end
end
