class History < ApplicationRecord
  belongs_to :user
  enum transaction_type: [:debited, :credited]
end
