module Api
  module V1
    class MessagesSerializer <  ActiveModel::Serializer

      attributes :id, :content, :user_id, :conversation_room_id
    end
  end
end
