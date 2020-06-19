# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @moves = Move.where(filter_params).sample(3)
  end

  private

  def filter_params
    params.permit(
      move_type: [],
      belt_level: []
    )
  end
end
