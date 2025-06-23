require "test_helper"

class ToolCallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tool_call = tool_calls(:one)
  end

  test "should get index" do
    get tool_calls_url
    assert_response :success
  end

  test "should get new" do
    get new_tool_call_url
    assert_response :success
  end

  test "should create tool_call" do
    assert_difference("ToolCall.count") do
      post tool_calls_url, params: { tool_call: { arguments: @tool_call.arguments, message_id: @tool_call.message_id, name: @tool_call.name, tool_call_id: @tool_call.tool_call_id } }
    end

    assert_redirected_to tool_call_url(ToolCall.last)
  end

  test "should show tool_call" do
    get tool_call_url(@tool_call)
    assert_response :success
  end

  test "should get edit" do
    get edit_tool_call_url(@tool_call)
    assert_response :success
  end

  test "should update tool_call" do
    patch tool_call_url(@tool_call), params: { tool_call: { arguments: @tool_call.arguments, message_id: @tool_call.message_id, name: @tool_call.name, tool_call_id: @tool_call.tool_call_id } }
    assert_redirected_to tool_call_url(@tool_call)
  end

  test "should destroy tool_call" do
    assert_difference("ToolCall.count", -1) do
      delete tool_call_url(@tool_call)
    end

    assert_redirected_to tool_calls_url
  end
end
