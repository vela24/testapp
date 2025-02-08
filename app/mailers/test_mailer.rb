class TestMailer < ActionMailer::Base
  # layout "hello"
  def hello(params)

    @greeting = params
    p "here are the params ***************************************"
    p params

    p "here is the mail ***************************************"
    mail(
      :subject => 'Hello from Postmark',
      :to  => 't.vela19@yahoo.com',
      :from => 'tvela@polarisrx.com',
      :content_type => 'text/html',
      :track_opens => 'true')
  end
end
