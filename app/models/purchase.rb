class Purchase < ApplicationRecord
  belongs_to :purchase_history

  # # NOT NULL制約
  # with_options presence: true do
  #   validates :postal_code, format:{ with: /^[0-9]{3}[-][0-9]{4}$/ }
  #   # validates :postal_code, format:{ with: /\A\d{3}[-]\d{4}\z/ }
  #   validates :city
  #   validates :house_number
  #   validates :phone_number, format:{ with: /[0-9]{10,11}/ }
  # end

end
