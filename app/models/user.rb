class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, length: { minimum: 6 },
                         format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    with_options format:{with: /\A[ぁ-んァ-ン一-龥]+\z/} do
    validates :last_name
    validates :first_name
    end
    with_options format: {with: /\A[ァ-ン]+\z/} do
    validates :last_name_kana
    validates :first_name_kana
    end
  end
end
