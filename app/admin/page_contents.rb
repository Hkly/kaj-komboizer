# frozen_string_literal: true

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

  form do |f|
    f.inputs 'About Page' do
      f.input :content_body, as: :quill_editor
    end
    f.actions
  end
end
