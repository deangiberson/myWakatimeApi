class StatsController < ApplicationController
  before_action :set_stat, only: [:show, :update, :destroy]

  # GET /stats
  # GET /stats.json
  def index
    @stats = Stat.all

    render json: {data:
                    @stats.map {|stat|
                    days = range_to_days(stat)
                    {
                      total_seconds: stat.total_seconds,
                      range: stat.range,
                      holidays: stat.holidays,
                      days_including_holidays: days,
                      days_minus_holidays: days - stat.holidays,
                      status: stat.status,
                      is_already_updating: stat.is_already_updating,
                      is_stuck: stat.is_stuck,
                      is_up_to_date: stat.is_up_to_date,
                      timeout: stat.timeout,
                      editors: stat.editors.map {|e|
                        {
                          name: e.name,
                          total_seconds: e.total_seconds,
                          percent: e.percent
                        }
                      }
                    }
                  }}
  end

  # GET /stats/1
  # GET /stats/1.json
  def show
    render json: @stat
  end

  # POST /stats
  # POST /stats.json
  def create
    @stat = Stat.new(stat_params)

    if @stat.save
      render json: @stat, status: :created, location: @stat
    else
      render json: @stat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stats/1
  # PATCH/PUT /stats/1.json
  def update
    @stat = Stat.find(params[:id])

    if @stat.update(stat_params)
      head :no_content
    else
      render json: @stat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stats/1
  # DELETE /stats/1.json
  def destroy
    @stat.destroy

    head :no_content
  end

  private

    def set_stat
      @stat = Stat.find(params[:id])
    end

    def stat_params
      params.require(:stat).permit(:user_id, :range, :holidays, :status, :is_already_updating, :is_stuck, :is_up_to_date, :start, :end, :timezone, :timeout, :writes_only, :total_seconds, :daily_average)
    end

    def range_to_days(stat)
      case stat.range
      when "last_7_days"
        7
      when "last_30_days"
        30
      when "last_6_months"
        180
      when "last_year"
        365
      else
        ((Time.at(stat.end) - Time.at(stat.start)) / 1.day).to_i
      end
    end
end
