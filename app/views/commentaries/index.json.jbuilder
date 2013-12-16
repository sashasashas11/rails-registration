json.array!(@commentaries) do |commentary|
  json.extract! commentary, 
  json.url commentary_url(commentary, format: :json)
end
