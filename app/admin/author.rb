ActiveAdmin.register Author do
  menu parent: 'Manage Books', priority: 2, label: 'Author'

  permit_params :name, :biography, :birth_date

  filter :name_cont, label: 'Name'

  form do |f|
    f.semantic_errors

    f.inputs 'Author' do
      f.input :name
      f.input :biography, as: :text
      f.input :birth_date, as: :datepicker
    end

    f.submit "Submit"
  end
end
