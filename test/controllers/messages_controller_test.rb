require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)
  end

  test "should get index" do
    get messages_url
    assert_response :success
  end

  test "should get new" do
    get new_message_url
    assert_response :success
  end

  test "should create message" do
    assert_difference("Message.count") do
      post messages_url, params: { message: { chat_id: @message.chat_id, content: @message.content, input_tokens: @message.input_tokens, model_id: @message.model_id, output_tokens: @message.output_tokens, role: @message.role, tool_call_id: @message.tool_call_id } }
    end

    assert_redirected_to message_url(Message.last)
  end

  test "should show message" do
    get message_url(@message)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_url(@message)
    assert_response :success
  end

  test "should update message" do
    patch message_url(@message), params: { message: { chat_id: @message.chat_id, content: @message.content, input_tokens: @message.input_tokens, model_id: @message.model_id, output_tokens: @message.output_tokens, role: @message.role, tool_call_id: @message.tool_call_id } }
    assert_redirected_to message_url(@message)
  end

  test "should destroy message" do
    assert_difference("Message.count", -1) do
      delete message_url(@message)
    end

    assert_redirected_to messages_url
  end
end
