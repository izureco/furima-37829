# PurchaseモデルとPurchase-historyモデルのFormオブジェクト
class PurchasePhistory
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :build_number, :phone_number,
                # purchaseモデルの属性値
                :item_id, :user_id,
                # purchase_historyモデルの属性値
                :token
                # JSから送られてくるtoken情報

  with_options presence: true do
    validates :postal_code, format:{ with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-) "}
    # validates :postal_code, format:{ with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, format:{ with: /[0-9]{10,11}/, message: "is invalid"}, length:{ in: 10..11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "should be select"}

  def save
    # Purchase_historyテーブルに保存
    history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    # Purchasesテーブルに保存
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, build_number: build_number, phone_number: phone_number, purchase_history_id: history.id)
  end
end