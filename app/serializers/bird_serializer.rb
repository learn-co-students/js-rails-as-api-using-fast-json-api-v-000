class BirdSerializer
  include FastJsonapi::ObjectSerializer
  attributes :names, :species
end
