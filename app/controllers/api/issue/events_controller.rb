module Api
  module Issue
    class EventsController < ApplicationController
      # before_action :authenticate_user

      def index
        issue_params = { number: params[:issue_id]}
        @events = Event.all.merge(Issue.where(issue_params))

        if @events.empty?
          render json: @events, status: :not_found
        else
          render json: @events, status: :ok
        end
      end
    end
  end
end