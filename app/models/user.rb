class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, length: { minimum: 6 },
                         format: { with: PASSWORD_REGEX }
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
