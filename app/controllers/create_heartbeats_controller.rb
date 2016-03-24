class CreateHeartbeatsController < ApplicationController
  before_action :set_create_heartbeat, only: [:show, :update, :destroy]

  # GET /create_heartbeats
  # GET /create_heartbeats.json
  def index
    @create_heartbeats = CreateHeartbeat.all

    render json: @create_heartbeats
  end

  # GET /create_heartbeats/1
  # GET /create_heartbeats/1.json
  def show
    render json: @create_heartbeat
  end

  # POST /create_heartbeats
  # POST /create_heartbeats.json
  def create
    @create_heartbeat = CreateHeartbeat.new(create_heartbeat_params)

    if @create_heartbeat.save
      render json: @create_heartbeat, status: :created, location: @create_heartbeat
    else
      render json: @create_heartbeat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /create_heartbeats/1
  # PATCH/PUT /create_heartbeats/1.json
  def update
    @create_heartbeat = CreateHeartbeat.find(params[:id])

    if @create_heartbeat.update(create_heartbeat_params)
      head :no_content
    else
      render json: @create_heartbeat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /create_heartbeats/1
  # DELETE /create_heartbeats/1.json
  def destroy
    @create_heartbeat.destroy

    head :no_content
  end

  private

    def set_create_heartbeat
      @create_heartbeat = CreateHeartbeat.find(params[:id])
    end

    def create_heartbeat_params
      params.require(:create_heartbeat).permit(:user_id, :entity, :type, :time, :project, :branch, :language, :dependencies, :lines, :lineno, :cursorpos, :is_write, :is_debugging)
    end
end
