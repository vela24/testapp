class PatientSurveyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.patient_survey_mailer.signup_survey.subject
  #
  def signup_survey(params)
    params.each do |k, v|
      p "checking key ************************"
      p k
    end
    @greeting = params

    mail to: "to@example.org"
  end
end
