ActiveAdmin.register BookVersion do
  permit_params %i[file_type book_id download_url]
end
