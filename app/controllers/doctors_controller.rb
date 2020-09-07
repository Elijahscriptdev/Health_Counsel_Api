class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show update destroy]
  skip_before_action :authorize_request, only: %i[index show create]
  
  # GET /doctors
  def index
    @doctors = Doctor.all

    render json: @doctors
  end

  # GET /doctors/1
  def show
    render json: @doctor
  end

  # POST /doctors
  # def create
  #   @doctor = Doctor.new(doctor_params)

  #   if @doctor.save
  #     render json: @doctor, status: :created, location: @doctor
  #   else
  #     render json: @doctor.errors, status: :unprocessable_entity
  #   end
  # end

  def create
    doctor = Doctor.create!(doctor_params)
    auth_token = AuthenticateUser.new(doctor.email, doctor.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  # PATCH/PUT /doctors/1
  def update
    if @doctor.update(doctor_params)
      render json: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctors/1
  def destroy
    @doctor.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def doctor_params
    params.permit(:name, :email, :password, :password_confirmation,
       :speciality, :hospital, :age, :experience_level)
  end
end
