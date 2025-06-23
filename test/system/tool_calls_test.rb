require "application_system_test_case"

class ToolCallsTest < ApplicationSystemTestCase
  setup do
    @tool_call = tool_calls(:one)
  end

  test "visiting the index" do
    visit tool_calls_url
    assert_selector "h1", text: "Tool calls"
  end

  test "should create tool call" do
    visit tool_calls_url
    click_on "New tool call"

    fill_in "Arguments", with: @tool_call.arguments
    fill_in "Message", with: @tool_call.message_id
    fill_in "Name", with: @tool_call.name
    fill_in "Tool call", with: @tool_call.tool_call_id
    click_on "Create Tool call"

    assert_text "Tool call was successfully created"
    click_on "Back"
  end

  test "should update Tool call" do
    visit tool_call_url(@tool_call)
    click_on "Edit this tool call", match: :first

    fill_in "Arguments", with: @tool_call.arguments
    fill_in "Message", with: @tool_call.message_id
    fill_in "Name", with: @tool_call.name
    fill_in "Tool call", with: @tool_call.tool_call_id
    click_on "Update Tool call"

    assert_text "Tool call was successfully updated"
    click_on "Back"
  end

  test "should destroy Tool call" do
    visit tool_call_url(@tool_call)
    accept_confirm { click_on "Destroy this tool call", match: :first }

    assert_text "Tool call was successfully destroyed"
  end
end
