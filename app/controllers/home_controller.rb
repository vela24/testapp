class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:terms_of_service, :patient_survey, :submit_form]
  protect_from_forgery with: :null_session, only: [:submit_form]

  def index
  end

  def users
  end

  def terms_of_service
  end

  def patient_survey
    # redirect_to root_path
  end
  def submit_form
    # PatientSurveyMailer.signup_survey(params[:anything]).deliver
    # p "checking current user in controller ***************************"
    # p current_user
    TestMailer.hello(params["anything"], current_user).deliver
    redirect_to root_path
  end
end
