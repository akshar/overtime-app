module SmsTool
  account_sid = Rails.application.secrets.twilio['TWILIO_ACCOUNT_SID']
  auth_token =  Rails.application.secrets.twilio['TWILIO_AUTH_TOKEN']
  @client = Twilio::REST::Client.new account_sid, auth_token

  def self.send_sms(number, message)
    @client.messages.create(
      from: Rails.application.secrets.twilio['TWILIO_PHONE_NUMBER'],
      to: "+91#{number}",
      body: "#{message}"
    )
  end
end
