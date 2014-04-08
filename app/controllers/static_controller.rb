# encoding: UTF-8
class StaticController < ApplicationController
  def home
    @informs = Inform.all
    @projects = Project.all
  end
end
