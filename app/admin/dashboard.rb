ActiveAdmin.register_page "Dashboard" do
  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }
  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end

    columns do
       column do
         panel "Ropas en Piezas" do
           ul do
             Inventory.all do |post|
               li link_to(post.name, '')
             end
           end
         end
       end

       column do
         panel "Info" do
           para "Welcome to ActiveAdmin."
         end
       end
    end
    end # content
    end
end

# ActiveAdmin::Dashboards.build do
#   section "Inventarios recientes" do
#     table_for Inventory.order("updated_at desc").limit(5) do
#       column :name do |inventory|
#         link_to inventory.name, [:admin, inventory]
#       end
#       column :updated_at
#     end
#     #strong { link_to "Ver el inventario", admin_products_path }
#   end
# end