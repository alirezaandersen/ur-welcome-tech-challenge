class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :conversation_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
