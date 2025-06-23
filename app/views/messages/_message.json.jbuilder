json.extract! message, :id, :chat_id, :role, :content, :model_id, :input_tokens, :output_tokens, :tool_call_id, :created_at, :updated_at
json.url message_url(message, format: :json)
