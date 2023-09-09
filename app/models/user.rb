class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :patients, dependent: :destroy
  has_many :appointments, dependent: :destroy

  enum role: { receptionist: 0, doctor: 1 }

  def admin?
    role == 'admin'
  end
end
