class NoticeMailer < ApplicationMailer
  def greeting
    @greeting = "Hi"
    mail to: "s12201600350@gmail.com"
  end
end
