class EmergenciesController < ApplicationController
  rescue_from ActionController::UnpermittedParameters, with: :catch_unpermitted_params
  def new
    render json: { message: 'page not found' }.to_json, status: 404
  end

  def show
  @emergency = Emergency.find_by_code(params[:code])
    if @emergency.present?
      render json: { emergency: @emergency }, status: 201
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
    @emergency = Emergency.new(emergency_params)
    if @emergency.valid? && @emergency.save
      render json: { emergency: @emergency }, status: 201
    else
      render json: { message: @emergency.errors.messages }, status: 422
    end
  end

  private

  def emergency_params
    params.require(:emergency).permit(:code, :fire_severity, :police_severity, :medical_severity)
  end

  def catch_unpermitted_params
    render json: { message: $ERROR_INFO.message }.to_json, status: 422
  end
end
