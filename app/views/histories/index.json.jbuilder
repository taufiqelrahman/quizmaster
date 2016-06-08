json.array!(@histories) do |history|
  json.extract! history, :id, :user_id, :question_set_id
  json.url history_url(history, format: :json)
end
