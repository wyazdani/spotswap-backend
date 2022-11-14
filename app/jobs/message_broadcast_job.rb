class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    payload = {
      id: message.id,
      body: message.body,
      conversation_id: message.conversation_id,
      read_status: message.read_status,
      sender_id: message.conversation.sender.id,
      sender_name: message.conversation.sender_name,
      recepient_id: message.conversation.recepient.id,
      recepient_name: message.conversation.recepient_name,
      created_at: message.created_at,
      message_image: message.image.attached? ? message.image.url : "",
      sender_image: message.conversation.sender_image.attached? ? message.conversation.sender_image.url : "",
      recepient_image: message.conversation.recepient_image.attached? ? message.conversation.recepient_image.url : ""
    }
    ActionCable.server.broadcast(build_conversation_id(message.conversation_id), payload)
  end
  
  def build_conversation_id(id)
    "conversation_#{id}"
  end
end