class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases, dependent: :destroy

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :birthday
    validates :password, format: { with: PASSWORD_REGEX }
    with_options format: { with: NAME_REGEX } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: NAME_KANA_REGEX } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end
