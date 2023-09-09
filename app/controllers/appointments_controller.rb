class AppointmentsController < ApplicationController
  # load_and_authorize_resource

  def index
    @appointments = Appointment.all 
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to "/patients", notice: 'Doctor appointment was created successfully!'
    else
      flash.now[:alert] = @appointment.error.full_messages.frist if @appointment.errors.any?
      render :new, status: 400
    end
  end

  private
  def find_user
    @user = current_user
  end

  def appointment_params
    params.require(:appointment).permit(:date, :status, :user_id, :patient_id)
  end
end
