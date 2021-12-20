class MessageGroupGenerator

  attr_reader :conversation_room_id

  def initialize(conversation_params)
    @conversation_room_id = conversation_params[:conversation_id]
  end

  def call
    converstation_exist?
    related_messages
    @chats
  end

  private

  def converstation_exist?
    chat_room = ConversationRoom.find_by(id: @conversation_room_id)
    raise(StandardError, message: 'Conversation Room does not exist', code: 404 ) unless chat_room.present?
  end

  def related_messages
    @chats = Message.where(conversation_room_id: @conversation_room_id)
    raise(StandardError, message: 'This Conversation Room does not have any Chats yet' , code: 422 ) unless @chats.present?
  end

end
