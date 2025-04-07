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
    @survey = Survey.new
  end

  def submit_form
    @survey = Survey.new(permitted_params)
    if @survey.save
      flash[:notice] = "You have successfully completed survey."
      TestMailer.hello(params["survey"], current_user).deliver
      redirect_to root_path
    else
      render :patient_survey, status: 422
    end
  end

  def permitted_params
    params.require(:survey).permit(:community_name, :id_number, :move_in_date, :pharmacy_name,
    :type_of_pharmacy, :correct_info, :patient_first_name, :patient_last_name, :patient_middle_initial, :ssn,
    :dob, :gender, :phone_number, :resident_financially_responsible, :representative_first_name, :representative_last_name, :relationship_to_resident,
    :legal_representative_address, :legal_rep_city, :legal_rep_state, :legal_rep_zip, :legal_rep_phone_number, :non_covered_medication,
    :all_information_correct, :no_prescription_insurance, :medicare_a, :medicare_b, :medicare_part_d, :medicare_a_effective_date,
    :medicare_b_effective_date, :medicare_part_d_up_to_amount, :medicare_part_d_id_number, :bin_pcn, :part_d_group_number,
    :part_d_phone_number, :medicaid, :medicaid_number, :medicaid_state, :medicaid_effective_date, :other_insurance, :other_insurance_name,
    :other_insurance_number, :other_insurance_phone_number, :hospice, :hospice_phone_number, :veteran_drug_benefit, :other, :other_name,
    :authorization_to_contact, :method_of_comm_name, :home_detailed_message, :home_message_callback_number_only, :cellphone_detailed_message,
    :work_detailed_message, :mail_to_home, :fax_to_home, :home_fax_number, :fax_to_work, :work_fax_number, :household_rep_1, :household_rep_2,
    :household_rep_3, :patient_signature, :patient_sign_date, :financially_responsible_name, :financially_responsible_signature,
    :financially_responsible_sign_date, :patient_inability_to_sign_reason, :credit_card_authorization_date, :cardholder_authorization_signature,
    :cardholder_name_of_resident, :cardholder_name, :type_of_card, :card_number, :credit_card_expiration_date, :visa_mastercard_sc,
    :amex_sc, :cc_billing_street, :cc_city, :cc_state, :cc_zip_code, :cc_phone, :cardholder_rep_signature, :cardholder_rep_sign_date,
    :card_max_per_month, :card_payment_end_date, :cardholder_rep_signature_2, :cardholder_rep_name_2, :non_covered_medication_up_to_amount)
  end
end
