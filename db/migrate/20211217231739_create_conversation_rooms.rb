class CreateConversationRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :conversation_rooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
