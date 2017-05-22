class Parcel < ApplicationRecord
validates(:name, presence: true, length: {maximum: 50})
validates(:quantity, presence: true)
validates(:phone, presence: true, length: {maximum: 15})
  
  def self.search(search_type, search_key)
    Parcel.where("#{search_type} LIKE ?", "%#{search_key}%")
  end
end
