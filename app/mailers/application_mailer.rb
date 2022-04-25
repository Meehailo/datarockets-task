class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILS_FROM']
  layout 'mailer'
end
