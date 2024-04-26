ActiveAdmin.register BookVersion do
  menu parent: 'Manage Books', priority: 4, label: 'Book Versions'

  permit_params %i[file_type book_id download_url]
end
