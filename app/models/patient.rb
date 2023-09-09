class Patient < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy

  enum gender: { Male: 'Male', Female: 'Female'}
end
