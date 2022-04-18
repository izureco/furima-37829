class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_date

  with_options presence: true do
    validates :title
    validates :description
    validates :image
  end

  validates :price, presence: true,
    format:{ with: /\A[0-9]+\z/},
    numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  with_options numericality: { other_than: 1 , message: "should be select" } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_date_id
  end

  # validate :price_is_exist

  # private

  # def price_is_exist
  #   # priceに対して行いたいvalidation
  #   ## ❶ 入力が空ではないか? -> "Price can't be black"
  #   ## ❷ 入力が半角数字ではないか? -> "Price is invalid. Input half-width characters"
  #   ## ❸ 入力が300-9999999の範囲内か? -> "Price greater or less than or equal to 300 or 999999"

  #   if price.blank?
  #     errors.add(:price, "can't be blank")
  #   elsif price !~ /\A[0-9]+\z/
  #     errors.add(:price, "は半角数字で入力してください")
  #   elsif 
  #   end
  # end
end
