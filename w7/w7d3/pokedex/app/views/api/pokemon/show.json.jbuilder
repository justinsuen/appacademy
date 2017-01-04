json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type
json.image_url asset_path(@pokemon.image_url)

json.items do
  json.array! @pokemon.items do |item|
    json.extract! item, :id, :name, :pokemon_id, :price, :happiness
    json.image_url asset_path(item.image_url)
  end
  # json.array! @pokemon.items, partial: 'api/items/item', as: :item
end
