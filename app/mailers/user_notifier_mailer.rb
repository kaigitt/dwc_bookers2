class UserNotifierMailer < ApplicationMailer
  default :from => "s12201600350@gmail.com"

    def send_signup_email
        @greeting = "Hi"
        mail( :to => "chocochips0106@ezweb.ne.jp", :subject => "会員登録が完了しました。" )
    end
end
