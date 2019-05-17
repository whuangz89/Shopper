class Product < ApplicationRecord
  belongs_to :user

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: proc {|attr| attr['name'].blank?},allow_destroy: true

  has_many :carts, dependent: :destroy
end
