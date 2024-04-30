class Author < ApplicationRecord
  include PgSearch
  include StringHandler

  before_save :clean_accent_marks

  multisearchable against: [:name, :biography, :no_accents_name]

  has_many :books

  scope :alphabetical, -> { order(name: :asc) }

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.ransackable_attributes(auth_object = nil)
    ["biography", "birth_date", "created_at", "id", "id_value", "name", "updated_at"]
  end

  private

  def clean_accent_marks
    return if self.changed.exclude?("name")

    self.no_accents_name = remove_accent_marks(title)
  end
end
