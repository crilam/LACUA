ActiveAdmin.register Cloth do
  index do
    column  :name
    column  :description
    column  :distintion
    column  :height
    column  :width
    column  :depth
    column  :color
    column  :feston
    column  :tipo
    column  :categoria do |cloth|
      cloth.category.name
    end
    default_actions
  end
  

end
