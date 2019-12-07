class BirdSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :species
  belongs_to :bird
  belongs_to :location
end
