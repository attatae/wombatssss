json.array!(@profiles) do |profile|
  json.extract! profile, :id, :profile_name, :about
  json.url profile_url(profile, format: :json)
end
