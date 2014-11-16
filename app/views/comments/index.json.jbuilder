json.array!(@comments) do |comment|
  json.extract! comment, :id, :body, :company_id
  json.url comment_url(comment, format: :json)
end
