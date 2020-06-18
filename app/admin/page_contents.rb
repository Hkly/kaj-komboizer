ActiveAdmin.register PageContent do
  permit_params :content_body

  index do
    column :page_name
    column :content_body
    actions
  end
end
