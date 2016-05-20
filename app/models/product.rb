class Product < ActiveRecord::Base
  belongs_to :category

  # sap xep mac dinh
  default_scope { order('name ASC') }

  # rang buoc presences
  validates :name, :description, :image_url, presence: true

  # rang buoc price phai la number >= 0.01
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  # rang buoc name la duy nhat
  validates :name, uniqueness: true

  #rang buoc image_url phai co duoi la gif, jpg, png
  validates :image_url, format: {with: %r{\.(gif|jpg|png)\z}i , message: 'must be a URL for GIF, JPG or PNG image.'}
end
