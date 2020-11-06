class ContactMailer < ApplicationMailer
  def contact_mail(blog)
    @blog = blog
    mail to: "tcasaikurukuru@yahoo.co.jp", subject: "お問い合わせの確認メール"
  end
end
