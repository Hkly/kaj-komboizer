ActiveAdmin.register PageContent do
  config.remove_action_item(:new)
  config.filters = false

  menu label: 'About Page'

  permit_params :content_body

  index do
    column :page_name
    column :content_body
    actions
  end
end
