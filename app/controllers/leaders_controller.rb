class LeadersController < ApplicationController
  before_action :set_leader, only: [:show, :update, :destroy]

  # GET /leaders
  # GET /leaders.json
  def index
    @leaders = Leader.all

    render json: @leaders
  end

  # GET /leaders/1
  # GET /leaders/1.json
  def show
    render json: @leader
  end

  # POST /leaders
  # POST /leaders.json
  def create
    @leader = Leader.new(leader_params)

    if @leader.save
      render json: @leader, status: :created, location: @leader
    else
      render json: @leader.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leaders/1
  # PATCH/PUT /leaders/1.json
  def update
    @leader = Leader.find(params[:id])

    if @leader.update(leader_params)
      head :no_content
    else
      render json: @leader.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leaders/1
  # DELETE /leaders/1.json
  def destroy
    @leader.destroy

    head :no_content
  end

  private

    def set_leader
      @leader = Leader.find(params[:id])
    end

    def leader_params
      params.require(:leader).permit(:user_id, :rank)
    end
end
