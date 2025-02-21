class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:terms_of_service, :patient_survey, :submit_form]
  protect_from_forgery with: :null_session, only: [:submit_form]

  def index
  end

  def users

    #Now creating a QR Code with above products details
    content = "Hello World."

    #For PNG image
    @qr_png = RQRCode::QRCode.new(content).as_png

    send_data @qr_png,
      type: "image/png",
      disposition: "attachment",
      filename: "qr_code.png"
  end

  def terms_of_service
  end

  def patient_survey
    # redirect_to root_path
  end
  def submit_form
    TestMailer.hello(params["anything"], current_user).deliver
    redirect_to root_path
  end
end
