json.array! @background_images.each do |background_image|
  json.id background_image.id
  json.name background_image.name
end