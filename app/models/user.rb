class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :birth_date,      presence: true

  # 正規表現を用いて、"全角文字"かどうか判定
  with_options presence: true, format:{ with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角文字を使用してください" } do
    validates :lastname_kanji
    validates :firstname_kanji
  end

  # 正規表現を用いて、"全角カナ"かどうか判定
  with_options presence: true, format:{ with: /\A[ァ-ヶー]+\z/, message: "全角カナを使用してください" } do
    validates :lastname_kana
    validates :firstname_kana
  end

  # 正規表現を用いて、passwordに"英数字が含まれている"か判定
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "には英字と数字の両方を含んでください", unless: -> {password.blank?}

  has_many :items, dependent: :destroy
  has_many :purchase_histories, dependent: :destroy
end
