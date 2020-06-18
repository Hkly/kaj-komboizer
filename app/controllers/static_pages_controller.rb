# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def about
    @content = PageContent.find_by(page_name: 'about')
  end
end
