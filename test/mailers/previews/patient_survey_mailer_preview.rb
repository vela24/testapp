# Preview all emails at http://localhost:3000/rails/mailers/patient_survey_mailer
class PatientSurveyMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/patient_survey_mailer/signup_survey
  def signup_survey
    PatientSurveyMailer.signup_survey
  end

end
