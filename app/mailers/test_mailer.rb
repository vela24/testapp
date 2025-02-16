class TestMailer < ActionMailer::Base
  # layout "hello"
  def hello(params, user)

    @greeting = params
    p "here are the params ***************************************"
    p params
    p user


    p "here is the mail ***************************************"
    mail(
      :subject => 'Hello from Mailgun',
      :to  => 't.vela19@yahoo.com',
      :from => 'tvela@polarisrx.com',
      :content_type => 'text/html',
      :track_opens => 'true')
  end
end
