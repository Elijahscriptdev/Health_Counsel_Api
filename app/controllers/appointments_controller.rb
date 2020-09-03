class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy]
  # skip_before_action :authorize_request, only: [:show]
  # GET /appointments
  def index
    # @appointments = Appointment.all
    # @user = current_user
    # render json: User.first.appointments.order(created_at: :desc), include: :doctor
    render json: current_user.appointments.order(created_at: :desc), include: :doctor
  end

  # GET /appointments/1
  def show
    render json: @appointment
  end

  # POST /appointments
  def create
    # @appointment = Appointment.new(appointment_params)
    

    # if @appointment.save
    #   render json: @appointment, status: :created, location: @appointment
    # else
    #   render json: @appointment.errors, status: :unprocessable_entity
    # end

    @appointment = Appointment.create!(appointment_params)
    json_response(@appointment)
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.permit(:meeting_info, :date, :time, :doctor_id, :user_id)
    end
end
