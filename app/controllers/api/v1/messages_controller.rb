module Api
  module V1
    class MessagesController < ApplicationController

      def index
        @room_messages = MessageGroupGenerator.new(conversation_params).call
        render json: @room_messages, status: :ok, each_serializer: Api::V1::MessagesSerializer
      end

      protected

      def conversation_params
        params.require(:message).permit(:conversation_id)
      end

    end
  end
end
