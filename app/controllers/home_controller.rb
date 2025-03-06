class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:terms_of_service, :patient_survey, :submit_form, :users]
  protect_from_forgery with: :null_session, only: [:submit_form, :users]

  def index
  end

  def users
    @users = User.all

    #Now creating a QR Code with above products details
    content = Rails.env.development? ? "http://localhost:3000/users/sign_up" : "https://sheltered-chamber-99174-f75c82d999a8.herokuapp.com/users/sign_up"
    #For PNG image
    @qr_png = RQRCode::QRCode.new(content).as_png

    #setup csv
    respond_to do |format|
      format.html
      format.csv do
        send_data User.to_csv, file_name: Date.today.to_s, content_type: "text/csv"
      end
      # format QR Code link
      format.png do
        send_data(
          @qr_png,
          type: "image/png",
          disposition: "attachment",
          filename: "qr_code.png"
        )
      end
    end
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
