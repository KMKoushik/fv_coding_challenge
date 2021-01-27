class CompareController < ApplicationController
  def index
  end

  def execute
    json_one = JSON.parse params[:file_one].read
    json_two = JSON.parse params[:file_two].read
    @diff = JsonService.new(json_one, json_two).compare
    render 'index'
  end
end
