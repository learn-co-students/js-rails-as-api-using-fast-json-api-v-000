class BirdSerializer
  # default arrangement:
  # include FastJsonapi::ObjectSerializer
  # attributes

  # stuff we added:
  # When rendering JSON directly, controllers will render all attributes
  # available by default. These serializers work the other way around - we must
  # always specify what attributes we want to include.
  include FastJsonapi::ObjectSerializer
  attributes :name, :species
end
