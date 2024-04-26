class Category < ApplicationRecord
  has_many :books

  scope :alphabetical, -> { order(name: :asc) }
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["books"]
  end

  def self.border_colors
    %i[red orange yellow green cyan blue purple pink]
  end
end
