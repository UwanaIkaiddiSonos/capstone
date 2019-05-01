json.array! @background_images.each do |background_image|
  json.id background_image.id
  json.scene_name background_image.scene_name
end