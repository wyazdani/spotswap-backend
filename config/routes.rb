Rails.application.routes.draw do
  root to: "admins/dashboard#index"
  mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :authentication ,only: [] do
        collection do
          post :login
          post :sign_up
          post :create_car_profile
          post :update_car_profile
          get :get_car_specification
          post :get_car_profile
          post :add_fcm_token
          post :notification_fcm_token
          post :logout
        end
      end

      resources :stripe_connects, only: [] do
        get :refresh_stripe_account_link
        get :user_stripe_connect_account
      end

      resources :cards ,only: [] do
        collection do
          get :get_all_cards
          post :create_card
          post :get_card
          post :update_card
          post :destroy_card
          post :set_default_card
          get :get_default_card
        end
      end

      resources :messages ,only: [] do
        collection do
          get :get_all_conversations
          post :get_all_messages
          post :create_message
          post :delete_message
          post :delete_conversation
          post :block_or_unblock_user
          post :create_conversation
        end
      end

      resources :users ,only: [] do
        collection do
          get :get_user
          post :update_user
        end
      end

      resources :reset_passwords ,only: [] do
        collection do
          post :send_otp
          post :verify_otp
          post :resend_otp
          post :reset_password
        end
      end

      resources :social_logins , only: [] do
        collection do
          post :social_login
        end
      end

      resources :static_pages, param: :permalink ,only: [] do
        member do
          get :index
        end
      end
      
      resources :supports, only: [] do
        collection do
          post :create_ticket
          post :create_message
          post :get_all_support_messages
          get :get_tickets
        end
      end

      resources :faqs, only: [] do
        collection do
          get :index
          post :create_faq
          post :update_faq
          post :delete_faq
        end
      end

      resources :parking_slots, only: [] do
        collection do
          post :create_slot
          post :make_slot_available
          post :get_all_spots
          post :get_all_finders
          post :transfer_slot
          post :notify_swapper_on_slot_transfer
        end
      end

      resources :quick_chats , only: [] do
        member do
          post :delete_quick_chat
        end
        collection do
          get :get_all_quick_chat
          post :create_quick_chat
          post :update_quick_chat
        end
      end

      resources :swapper_host_connections, only: [] do
        collection do
          post :create_connection
          post :update_screen_navigation_flags
          post :destroy_connection
          post :notify_host_on_cancel_request
          post :notify_swapper_for_confirm_arrival
        end
      end

      resources :stripe_connects, only: [] do
        collection do
          get :retrieve_connect_account
          get :user_stripe_connect_account
          get :create_login_link
        end
      end

    end
  end
  
  namespace :admins do
    resources :dashboard, only: [] do
      collection do
        get :index
        get :sub_admins_index
        post :create_sub_admin
        get :delete_sub_admin
      end
    end

    resources :users, only: [] do
      collection do
        get :index
        get :view_profile
        get :send_money_popup
        get :disable_user_popup
        get :confirm_yes_popup
      end
    end

    resources :cars, only: [] do
      collection do
        get :index
        get :edit_model
        get :get_model_details
        get :delete_model
        post :create_brand
        post :create_model
        post :update_model
      end
    end

    resources :guidelines, only: [] do
      collection do
        get :terms_and_conditions
        get :privacy_policy
        get :faqs
        get :edit_terms_and_conditions
        post :update_terms_and_conditions
        get :edit_faq
        get :destroy_faq
      end
    end

    resources :supports, only: [] do
      collection do
        get :index
        post :admin_send_message
      end
    end
  end

  devise_for :admins,
  controllers: {
      passwords: 'admins/passwords'
  }
  
  get '/*a', to: 'api/v1/api#not_found'
end
