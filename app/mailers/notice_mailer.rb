class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.greeting.subject
  #
  def greeting
    @greeting = "Hi"

    mail to: "jrgpa99590@yahoo.co.jp"
  end
end
