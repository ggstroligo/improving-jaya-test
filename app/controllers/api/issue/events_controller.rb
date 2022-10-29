module Api
  module Issue
    class EventsController < ApplicationController
      before_action :authenticate_user!

      def index
        issue_params = { number: params[:issue_id] }
        serialize = IssueEventSerializer

        @events = ::Event.joins(:issue)
                         .where(issues: issue_params)
                         .select(:action, :created_at)
                         .map { |event| serialize[event] }

        if @events.empty?
          render json: @events, status: :not_found
        else
          render json: @events, status: :ok
        end
      end
    end
  end
end