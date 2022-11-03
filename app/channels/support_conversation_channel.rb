class SupportConversationChannel < ApplicationCable::Channel 
  # calls when a client connects to the server
  def subscribed
    puts "##############"
    puts params
    puts "##############"

    if params[:support_conversation_id].present?
      stream_from("support_conversation_#{(params[:support_conversation_id])}")
    else
      puts "support_conversation_id is missing."
    end
  end

  def unsubscribed
    stop_all_streams
  end
  
  # calls when a client broadcasts data
  def receive(data)
    sender = get_sender(data)
    support_conversation_id = data['support_conversation_id']
    message = data['body']

    raise 'No support_conversation_id!' if support_conversation_id.blank?
    convo = get_convo(support_conversation_id)
    raise 'No support conversation found!' if convo.blank?
    raise 'Body is blank!' if message.blank?
    convo.support_messages.create(body: message, sender_id: sender.id, user_id: current_user.id)
  end
  
  # Helpers
  
  def get_convo(support_conversation_id)
    SupportConversation.find_by(id: support_conversation_id)
  end
  
  def get_sender(data)
    User.find_by(id: data['sender_id'])
  end
  
end
