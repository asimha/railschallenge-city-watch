class RespondersController < ApplicationController
  rescue_from ActionController::UnpermittedParameters, with: :catch_unpermitted_params
  def new
    render json: { message: 'page not found' }.to_json, status: 404
  end

  def index
    @responders = Responder.all
    render json: { responders: @responders }.to_json, status: 200
  end

  def show
    @responder = Responder.find_by_name(params[:name])
    if @responder.present?
      render json: { responder: @responder }, status: 201
    else
      render json: {}, status: 404
    end
  end

  def edit
    render json: { message: 'page not found' }.to_json, status: 404
  end

  def destroy
    render json: { message: 'page not found' }.to_json, status: 404
  end

  def create
    @responder = Responder.new(responders_params)
    if @responder.valid? && @responder.save
      render json: { responder: @responder }.to_json, status: 201
    else
      render json: { message: @responder.errors.messages }, status: 422
    end
  end

  def update
    @responder = Responder.find_by_name(params[:name])
    if @responder.update_attributes(responder_update_params)
      render json: { responder: @responder }, status: 201
    else
      render json: { message: @responder.errors.messages }, status: 422
    end
  end

  private

  def responders_params
    params.require(:responder).permit(:type, :name, :capacity)
  end

  def responder_update_params
    params.require(:responder).permit(:type, :name, :capacity, :on_duty)
  end

  def catch_unpermitted_params
    render json: { message: $ERROR_INFO.message }.to_json, status: 422
  end
end
