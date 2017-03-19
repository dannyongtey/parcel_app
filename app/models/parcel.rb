class Parcel < ApplicationRecord
  
  def self.search(search_type, search_key)
    Parcel.where("#{search_type} LIKE ?", "%#{search_key}%")
  end
end
