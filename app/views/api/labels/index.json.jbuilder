json.array! @labels.each do |label|
  json.id label.id
  json.name label.name
end