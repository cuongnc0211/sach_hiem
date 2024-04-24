class Category < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "name", "updated_at"]
  end

  def self.border_colors
    %i[red orange yellow green cyan blue purple pink]
  end
end
