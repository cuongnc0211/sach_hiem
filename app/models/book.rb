class Book < ApplicationRecord
  STATUSES = %w[draft published archived].freeze

  belongs_to :author
  belongs_to :category
  has_many :book_versions, dependent: :destroy

  enum status: STATUSES.zip(STATUSES).to_h

  accepts_nested_attributes_for :book_versions

  has_one_attached :thumbnail

  # has_rich_text :description

  def self.ransackable_associations(auth_object = nil)
    ["author", "book_versions", "category"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["author_id", "category_id", "created_at", "description", "id", "id_value", "original_title", "publication_date", "status", "title", "updated_at"]
  end

  delegate :name, to: :author, prefix: true

  def publish_year
    publication_date&.year
  end
end
