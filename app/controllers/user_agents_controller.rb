class UserAgentsController < ApplicationController
  before_action :set_user_agent, only: [:show, :update, :destroy]

  # GET /user_agents
  # GET /user_agents.json
  def index
    @user_agents = UserAgent.all

    render json: @user_agents
  end

  # GET /user_agents/1
  # GET /user_agents/1.json
  def show
    render json: @user_agent
  end

  # POST /user_agents
  # POST /user_agents.json
  def create
    @user_agent = UserAgent.new(user_agent_params)

    if @user_agent.save
      render json: @user_agent, status: :created, location: @user_agent
    else
      render json: @user_agent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_agents/1
  # PATCH/PUT /user_agents/1.json
  def update
    @user_agent = UserAgent.find(params[:id])

    if @user_agent.update(user_agent_params)
      head :no_content
    else
      render json: @user_agent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_agents/1
  # DELETE /user_agents/1.json
  def destroy
    @user_agent.destroy

    head :no_content
  end

  private

    def set_user_agent
      @user_agent = UserAgent.find(params[:id])
    end

    def user_agent_params
      params.require(:user_agent).permit(:user_id, :user_agent, :editor, :version, :os, :last_seen)
    end
end
