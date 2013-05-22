ActiveAdmin.register Cloth do
  index do
    column  :distintion
    column  :height
    column  :width
    column  :depth
    column  :color
    column  :feston
    column  :tipo
    column  :category_id
    column  :name
    column  :description
    default_actions
  end
  

end
