class DurationsController < ApplicationController
  # before_action :set_duration, only: [:show, :update, :destroy]

  # GET /durations
  # GET /durations.json
  def index
    get_user

    if !@user
      render_not_found
    elsif !has_access?
      forbidden
    else
      render_duration
    end
  end

  def render_duration
    @date = params[:date]

    if !@date
      render_missing_date
      return
    end

    begin
      date = Date.parse(@date)
    rescue ArgumentError => error
      render_invalid_date
      return
    end

    dayStart = date.to_time.to_i
    dayEnd = (date + 1).to_time.to_i

    @durations = Duration.where('user_id = ? AND time >= ? AND time < ?', @user.id, dayStart, dayEnd)

    times = @durations.map {|d| d.created_at}
    # render json: @durations
    render json: {
             data: @durations.map {|d|
               {
                 project: d.project,
                 time: d.time,
                 duration: d.duration
               }},
             branches: @durations.map {|d| d.branch},
             start: times.first,
             end: times.last}
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

    def render_missing_date
      render json: {error: "Missing date."}
    end

    def render_invalid_date
      render json: {error: "Invalid date."}
    end

end
