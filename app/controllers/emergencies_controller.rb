class EmergenciesController < ApplicationController
  def new
    render :json => {:message => "page not found"}.to_json, :status => 404
  end

  def edit
    render :json => {:message => "page not found"}.to_json, :status => 404
  end

  def destroy
    render :json => {:message => "page not found"}.to_json, :status => 404
  end
end
