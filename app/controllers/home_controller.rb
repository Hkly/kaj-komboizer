# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    ids = Move.where(filter_params).pluck(:id).sample(3)
    @moves = Move.find(ids)
  end

  private

  def filter_params
    params.permit(
      move_type: [],
      belt_level: []
    )
  end
end
