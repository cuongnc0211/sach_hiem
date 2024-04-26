class BookVersion < ApplicationRecord
  ALLOWED_FILE_TYPE = %w[pdf epub mobi].freeze

  belongs_to :book

  has_one_attached :file

  enum file_type: ALLOWED_FILE_TYPE.zip(ALLOWED_FILE_TYPE).to_h

  scope :type_sort, ->() { order(file_type: :asc) }

  def self.ransackable_attributes(auth_object = nil)
    ["book_id", "created_at", "download_url", "file_type", "id", "id_value", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["book"]
  end
end
