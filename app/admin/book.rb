ActiveAdmin.register Book do
  permit_params %i[title original_title description publication_date status author_id category_id]
end
