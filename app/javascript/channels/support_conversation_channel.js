import consumer from "./consumer"
$(document).ready(function() {
    const chat_id = $("#chatmessagebox").attr('data-id');
    const email = $("#admin_email").data("admin");
    console.log(chat_id);
    consumer.subscriptions.create({channel: "SupportConversationChannel", id: "support_conversation_" + chat_id}, {
        connected() {
            console.log("Connected SupportConversation Channel")
            // Called when the subscription is ready for use on the server
        },

        disconnected() {
            // Called when the subscription has been terminated by the server
        },

        received(data) {
            if(data.support_conversation_id== chat_id)
            {
                if(data.user_id == null)
                {
                    $(".msg_contain").append('<div class="msg admin">'+
                        '<div class="profile">'+
                        "<img src='/assets/default-profile.jpg'>"+
                        '</div>'+
                        '<div class="msg_wrapper">'+
                        '<div class="msg_blk">'+
                        '<p>'+data.body+'</p>'+
                        '</div>'+
                        '<p>'+data.created_at +'</p>'+
                        (data.message_image != null ?
                        '<div class="attch_blk">'+
                             "<img src="+data.message_image+">"+
                        '</div>'
                            : '')+
                        '</div>'

                    );


                }
                else
                {

                    $(".msg_contain").append('<div class="msg user">'+
                        '<div class="profile">'+
                        (data.sender_image == null ? "<img src="+data.sender_image+">" : "<img src='/assets/default-profile.jpg'>")+
                        '</div>'+
                        '<div class="msg_wrapper">'+
                        '<div class="msg_blk">'+
                        '<p>Open a Support Ticket <strong>'+
                        data.ticket_number.ticket_number+
                        '</strong></p>'+
                        '<p>'+data.body+'</p>'+
                        (data.message_image != null ?
                            '<div class="attch_blk">'+
                                "<img src="+data.message_image+">"+
                                '<div class="img">'+'<img src="assets/icon-download.svg" alt="">'+'</div>'+
                                    '<button type="button" class="btn down_btn">'+ '</button>'+
                                '</div>': '')+
                        '</div>'+'<p>'+data.created_at+'</p>'+
                        '</div>'+
                        '</div>');


                }
                $(".msg_contain").scrollTop($(".msg_contain")[0].scrollHeight);

            }
        }
    });

});
