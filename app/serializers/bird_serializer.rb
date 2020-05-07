class BirdSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name #, :species

  # attribute :genus_and_species do |bird|
  #   taxonomy = bird.species.split(" ")
  #   "Genus: #{taxonomy.first}, Species: #{taxonomy.last}"
  # end

  attribute :genus_and_species, &:species
end
