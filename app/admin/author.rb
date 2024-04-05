ActiveAdmin.register Author do
  permit_params :name, :biography, :birth_date
end
