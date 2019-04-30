json.array! @transitions.each do |transition|
  json.id transition.id
  json.name transition.name
end