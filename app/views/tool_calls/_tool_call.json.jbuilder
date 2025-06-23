json.extract! tool_call, :id, :message_id, :tool_call_id, :name, :arguments, :created_at, :updated_at
json.url tool_call_url(tool_call, format: :json)
