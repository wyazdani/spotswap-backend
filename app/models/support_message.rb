class SupportMessage < ApplicationRecord
  belongs_to :user
  belongs_to :support_conversation
  has_one_attached :image, dependent: :destroy
  has_one_attached :file, dependent: :destroy

  after_create_commit { MessageBroadcastJob.perform_later(self) }

end
