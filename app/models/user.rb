class User < ApplicationRecord
  has_many :room_bookings
  has_one :profile
  has_many :homes
  before_create :build_default_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private
  def build_default_profile
    build_profile #buildメソッドとは、インスタンスを生成するメソッド。モデルの関連付けでもbuildメソッドは用いられる。
  end
end
