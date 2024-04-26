ActiveAdmin.register Author do
  menu parent: 'Manage Books', priority: 2, label: 'Author'

  permit_params :name, :biography, :birth_date
end
