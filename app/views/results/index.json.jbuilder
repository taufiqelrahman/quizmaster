json.array!(@results) do |result|
  json.extract! result, :id, :user_answer, :user_result, :user_id, :question_id, :history_id
  json.url result_url(result, format: :json)
end
