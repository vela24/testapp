require "test_helper"

class PatientSurveyMailerTest < ActionMailer::TestCase
  test "signup_survey" do
    mail = PatientSurveyMailer.signup_survey
    assert_equal "Signup survey", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
