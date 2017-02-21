require 'sendgrid-ruby'

def send_email(from, subject, to, content )
  from = SendGrid::Email.new(email: from)
  subject = subject
  to = SendGrid::Email.new(email: to)
  content = SendGrid::Content.new(type: 'text/html', value: content)
  
  mail = SendGrid::Mail.new(from, subject, to, content)
  
  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  
  response.status_code
end