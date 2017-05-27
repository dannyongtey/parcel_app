class Parcel < ApplicationRecord
  validates(:name, presence: true, length: {maximum: 50})
  validates(:quantity, presence: true)
  validates(:phone, presence: true, length: {maximum: 15})
  default_scope -> {order(created_at: :desc)}
  def self.search(search_type, search_key)
    if Rails.env.production?
      Parcel.where("#{search_type} ILIKE ?", "%#{search_key}%")
    else
      Parcel.where("#{search_type} LIKE ?", "%#{search_key}%")
    end
  end
end
