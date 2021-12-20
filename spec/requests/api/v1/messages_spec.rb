require 'rails_helper'

RSpec.describe "GET Messages", type: :request do
  describe "GET Messages for Conversation Room" do

    context "messages from specific conversation room" do
      let(:user) { create(:user) }
      let!(:conversation_room) { create(:conversation_room) }

      it "finds the messages associated with the conversation room" do
        create_list(:message, 4, conversation_room: conversation_room, user: user)
        get "/api/v1/messages", as: :json, params: { message: { conversation_id: conversation_room.id }}
        expect(ConversationRoom.find(conversation_room.id).messages.count).to eq(4)
        expect(response).to have_http_status(200)
      end

      it "conversation room has no messages" do
        get "/api/v1/messages", as: :json, params: { message: { conversation_id: conversation_room.id }}
        expect(ConversationRoom.find(conversation_room.id).messages.count).to eq(0)
        expect(response.body).to eq("This Conversation Room does not have any Chats yet")
        expect(response).to have_http_status(422)
      end
    end

    it "converstation room does not exist" do
      get "/api/v1/messages", as: :json, params: { message: { conversation_id: nil }}
      expect { ConversationRoom.count }.not_to change { ConversationRoom.count }
      expect(response.body).to eq("Conversation Room does not exist")
      expect(response).to have_http_status(404)
    end
  end
end
