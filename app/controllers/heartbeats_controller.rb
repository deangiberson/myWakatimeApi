class HeartbeatsController < ApplicationController
  #before_action :set_heartbeat, only: [:show, :update, :destroy]

  # GET /heartbeats
  # GET /heartbeats.json
  def index
    get_user
    if has_access?
      @heartbeats = Heartbeat.find_by(user: @user)
      render json: @heartbeats
    else
      forbidden
    end
  end

  # GET /heartbeats/1
  # GET /heartbeats/1.json
  def show
    render json: @heartbeat
  end

  # POST /heartbeats
  # POST /heartbeats.json
  def create
    @heartbeat = Heartbeat.new(heartbeat_params)

    if @heartbeat.save
      render json: @heartbeat, status: :created, location: @heartbeat
    else
      render json: @heartbeat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /heartbeats/1
  # PATCH/PUT /heartbeats/1.json
  def update
    @heartbeat = Heartbeat.find(params[:id])

    if @heartbeat.update(heartbeat_params)
      head :no_content
    else
      render json: @heartbeat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /heartbeats/1
  # DELETE /heartbeats/1.json
  def destroy
    @heartbeat.destroy

    head :no_content
  end

  private

    def set_heartbeat
      @heartbeat = Heartbeat.find(params[:id])
    end

    def heartbeat_params
      params.require(:heartbeat).permit(:user_id, :entity, :entity_type, :time, :project, :branch, :language, :dependencies, :lines, :lineno, :cursorpos, :is_write, :is_debugging)
    end
end
