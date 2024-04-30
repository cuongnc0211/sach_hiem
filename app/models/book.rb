class Book < ApplicationRecord
  include PgSearch
  include StringHandler

  multisearchable against: [:title, :original_title, :description, :no_accents_title],
    using: { 
      tsearch: {
        prefix: true, dictionary: "english", any_word: true, sort_only: true
      }
    }

  pg_search_scope :search_title,
    against: [:title, :original_title, :description, :no_accents_title],
    associated_against: { author: [:name, :no_accents_name] },
    using: { 
      tsearch: {
        prefix: true, dictionary: "english", any_word: true, sort_only: true
      }
    }


  STATUSES = %w[draft published archived].freeze

  before_save :clean_accent_marks

  belongs_to :author, optional: true
  belongs_to :category, optional: true
  has_many :book_versions, dependent: :destroy

  enum status: STATUSES.zip(STATUSES).to_h

  accepts_nested_attributes_for :book_versions, allow_destroy: true

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

  private

  def clean_accent_marks
    return if self.changed.exclude?("title")

    self.no_accents_title = remove_accent_marks(title)
  end
end
