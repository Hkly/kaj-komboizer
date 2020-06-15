# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    ids = Move.pluck(:id).sample(3)
    @moves = Move.find(ids)
  end
end
