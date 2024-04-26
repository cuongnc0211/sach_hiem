ActiveAdmin.register Category do
  menu parent: 'Manage Books', priority: 1, label: 'Categories'

  permit_params :name, :description
end
