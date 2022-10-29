module Webhook
  module Github
    class IssueEventsController < ::ApplicationController
      before_action :authenticate_webhook!

      # POST webhook/github/issue_events
      def create
        head(:unprocessable_entity) && return unless issue_action?

        event_params = { event_action: params[:action]}
        issue_params = { issue_number: params[:issue][:number], issue_title: params[:issue][:title] }

        service = Issues::CreateEvent.new(**issue_params, **event_params)
        if service.call
          head :created
        end
      end

      private

      def params = JSON.parse(request.body.read).deep_symbolize_keys rescue {}
      def issue_action? = params[:issue].present?
    end
  end
end