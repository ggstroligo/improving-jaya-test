module Webhook
  module Github
    class IssueEventsController < ::ApplicationController
      before_action :authenticate_webhook!

      # POST webhook/github/issue_events
      def create
        head(:unprocessable_entity) && return unless issue_action?

        event_params = { action: params[:action]}
        issue_params = { number: params[:issue][:number], title: params[:issue][:number] }

        service = Issue::Event::Create.new(issue_params:, event_params:)

        if service.call
          head :created
        end
      end

      private

      def params = JSON.parse(request.body.read) rescue {}
      def issue_action? = params[:issue].present?
    end
  end
end