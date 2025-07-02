class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :tool_call

  # Optional: Add this line to enable attachment support
  has_many_attached :attachments
  # Provides methods like tool_call?, tool_result?
  acts_as_message # Assumes Chat and ToolCall model names

  broadcasts_to ->(message) { [ message.chat, "messages" ] }


  # --- Add your standard Rails model logic below ---
  # Note: Do NOT add "validates :content, presence: true"
  # This would break the assistant message flow described above

  # These validations are fine:
  validates :role, presence: true
  validates :chat, presence: true

  # Helper to broadcast chunks during streaming
  def broadcast_append_chunk(chunk_content)
    broadcast_append_to [ chat, "messages" ], # Target the stream
      target: dom_id(self, "content"), # Target the content div inside the message frame
      html: chunk_content # Append the raw chunk
  end
end
