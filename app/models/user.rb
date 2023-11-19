class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :familyname_kanji, presence: true
  validates :firstname_kanji, presence: true
  validates :familyname_katakanai, presence: true
  validates :firstname_katakana, presence: true
  validates :birthday, presence: true
end
