class DurationsController < ApplicationController
  # before_action :set_duration, only: [:show, :update, :destroy]

  # GET /durations
  # GET /durations.json
  def index
    get_user
    if has_access?
      @durations = Duration.find_by(user: @user)
      render json: @durations
    else
      head :unauthorized
    end
  end

  # GET /durations/1
  # GET /durations/1.json
  def show
    render json: @duration
  end

  # POST /durations
  # POST /durations.json
  def create
    @duration = Duration.new(duration_params)

    if @duration.save
      render json: @duration, status: :created, location: @duration
    else
      render json: @duration.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /durations/1
  # PATCH/PUT /durations/1.json
  def update
    @duration = Duration.find(params[:id])

    if @duration.update(duration_params)
      head :no_content
    else
      render json: @duration.errors, status: :unprocessable_entity
    end
  end

  # DELETE /durations/1
  # DELETE /durations/1.json
  def destroy
    @duration.destroy

    head :no_content
  end

  private

    def set_duration
      @duration = Duration.find(params[:id])
    end

    def duration_params
      params.require(:duration).permit(:user_id, :project, :time, :duration, :branch)
    end
end
