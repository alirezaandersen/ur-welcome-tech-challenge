FactoryBot.define do
  factory :message do
    content { "MyString" }
    user { nil }
    conversation_room { nil } 
  end
end
