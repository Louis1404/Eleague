module Api
  module V1
    class TeamsController < ApplicationController
      before_action :set_team, only: [:show, :destroy]

      def index
        render json: Team.all
      end

      def create
        @team = Team.create(team_params)
        if @team.save
          render json: @team, status: 201
        else
          render json: { errors: @team.errors.full_messages }, status: 422
        end
      end

      def show
        render json: @team = Team.find(params[:id])
      end

      def destroy
        @team.destroy
        render :show, status: :ok
      end

      private
      def set_team
        @team = Team.find(params[:id])
      end

      def team_params
        params.permit(:name)
      end
    end
  end
end
