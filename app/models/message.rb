class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :tool_call

  acts_as_message # Basic RubyLLM integration

  # Optional: Add this line to enable attachment support
  has_many_attached :attachments
  # Provides methods like tool_call?, tool_result?
  acts_as_message # Assumes Chat and ToolCall model names

  # --- Add your standard Rails model logic below ---
  # Note: Do NOT add "validates :content, presence: true"
  # This would break the assistant message flow described above

  # These validations are fine:
  validates :role, presence: true
  validates :chat, presence: true
end
