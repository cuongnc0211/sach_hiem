ActiveAdmin.register Book do
  menu parent: 'Manage Books', priority: 3, label: 'Books'

  permit_params :title, :original_title, :description, :publication_date, :status, :author_id, :category_id, :thumbnail,
                book_versions_attributes: %i[id file_type file _destroy]

  filter :title_cont, label: 'Title'
  filter :original_title_cont, label: 'Original title'
  filter :author_name_cont, label: 'Author'
  filter :status, as: :select, collection: Book.statuses.keys.map { |status| [status.humanize, status] }
  filter :category_name, as: :select, collection: Category.alphabetical.map { |category| [category.name, category.id] }
  filter :book_versions_file_type, as: :select, collection: BookVersion.file_types.keys.map { |file_type| [file_type.humanize, file_type] }

  form do |f|
    nested_errors = f.object.errors.select { |err| err.instance_of?(ActiveModel::NestedError) }
    if nested_errors.present?
      # add nested errors to base errors
      f.object.errors.add(:base, nested_errors.map(&:message).join(', '))
    end

    columns do
      column do
        f.semantic_errors
        f.inputs 'Books' do
          f.input :author_id, as: :select, collection: Author.alphabetical.map { |author| [author.name, author.id] }, input_html: { class: 'select2 form-control' }
          f.input :category_id, as: :select, collection: Category.alphabetical.map { |c| [c.name, c.id] }, input_html: { class: 'select2 form-control' }

          f.input :title
          f.input :original_title
          f.input :thumbnail, as: :file
          f.input :status, as: :select, collection: Book.statuses.keys.map { |status| [status.humanize, status] }
          f.input :publication_date, as: :datepicker

          f.input :description, as: :text
          # f.input :description, as: :action_text
        end

        f.submit "Submit"
      end

      column do
        f.inputs "Book versions" do
          f.object.book_versions.build if f.object.book_versions.blank?

          f.has_many :book_versions, heading: 'Books versions', allow_destroy: true do |d|
            d.input :id, as: :hidden
            d.input :file_type, as: :select, collection: BookVersion.file_types.keys.map { |file_type| [file_type.humanize, file_type] }
            d.input :file, as: :file
          end

          # f.semantic_fields_for :book_versions do |ff|
          #   ff.input :id, as: :hidden
          #   ff.input :file_type, as: :select, collection: BookVersion.file_types.keys.map { |file_type| [file_type.humanize, file_type] }
          #   ff.input :file, as: :file

          #   ff.input :_destroy, :as => :boolean

          #   # link_to_add_association 'add version', ff, :book_versions
          # end
        end
      end
    end
  end

  controller do
    def new
      super do

        # build a new book version
        resource.book_versions.build
      end
    end
  end
end
