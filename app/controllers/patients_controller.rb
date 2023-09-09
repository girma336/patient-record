class PatientsController < ApplicationController
  load_and_authorize_resource

  def index
    @patients = Patient.all
  end

  def new
    @user = current_user
    @patient = Patient.new
  end
  
  def show
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
        redirect_to @patient, notice: 'Patient was created successfully'
    else
      flash.now[:alert] = @patient.errors.full_messages.first if @patient.errors.any?
      render :new, status: 400 
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    if @patient.destroy
      redirect_to patient_path, notice: 'Patient was deleted successfully'
    else
      flash.now[:alert] = @patient.errors.full_messages.first if @patient.errors.any?
      render :index, alert: 'Error: Patient not deleted'
    end
  end

  private

  def find_user
    @user = current_user
  end

  def patient_params
    params.require(:patient).permit(:name, :date_of_birth, :gender, :user_id)
  end

end
