class ToolCallsController < ApplicationController
  before_action :set_tool_call, only: %i[ show edit update destroy ]

  # GET /tool_calls or /tool_calls.json
  def index
    @tool_calls = ToolCall.all
  end

  # GET /tool_calls/1 or /tool_calls/1.json
  def show
  end

  # GET /tool_calls/new
  def new
    @tool_call = ToolCall.new
  end

  # GET /tool_calls/1/edit
  def edit
  end

  # POST /tool_calls or /tool_calls.json
  def create
    @tool_call = ToolCall.new(tool_call_params)

    respond_to do |format|
      if @tool_call.save
        format.html { redirect_to @tool_call, notice: "Tool call was successfully created." }
        format.json { render :show, status: :created, location: @tool_call }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tool_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tool_calls/1 or /tool_calls/1.json
  def update
    respond_to do |format|
      if @tool_call.update(tool_call_params)
        format.html { redirect_to @tool_call, notice: "Tool call was successfully updated." }
        format.json { render :show, status: :ok, location: @tool_call }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tool_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tool_calls/1 or /tool_calls/1.json
  def destroy
    @tool_call.destroy!

    respond_to do |format|
      format.html { redirect_to tool_calls_path, status: :see_other, notice: "Tool call was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tool_call
      @tool_call = ToolCall.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tool_call_params
      params.expect(tool_call: [ :message_id, :tool_call_id, :name, :arguments ])
    end
end
