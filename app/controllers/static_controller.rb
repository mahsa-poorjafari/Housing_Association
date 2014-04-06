# encoding: UTF-8
class StaticController < ApplicationController
  def home
    @informs = Inform.all
  end
end
