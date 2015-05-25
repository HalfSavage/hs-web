json.array!(@genders) do |gender|
  json.extract! gender, :id, :name, :abbreviation, :active
  json.url gender_url(gender, format: :json)
end
