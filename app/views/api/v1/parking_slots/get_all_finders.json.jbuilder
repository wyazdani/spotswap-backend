json.finders @compatible_users do |user|
  json.id user.id
  json.name user.name
  json.email user.email
  json.contact user.contact
  json.country_code user.country_code
  json.profile_complete user.profile_complete
  json.profile_type user.profile_type
  json.is_info_complete user.is_info_complete
  json.latitude user.latitude
  json.longitude user.longitude
  json.address user.address
  json.image user.image.attached? ? user.image.url : ""
end