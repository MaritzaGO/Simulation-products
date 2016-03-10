json.array!(@buyers) do |buyer|
  json.extract! buyer, :id, :name, :lastname, :identification, :edad, :profesion
  json.url buyer_url(buyer, format: :json)
end
