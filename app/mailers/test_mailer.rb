class TestMailer < ActionMailer::Base
  # layout "hello"
  def hello(params, user)

    @greeting = params

    mail(
      :subject => 'Patient Survey',
      :to  => 't.vela19@yahoo.com',
      :from => 'tvela@polarisrx.com',
      # :content_type => 'text/html',
      # :track_opens => 'true'
    )
  end
end
