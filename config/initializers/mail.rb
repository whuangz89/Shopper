ActionMailer::Base.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    user_name: "babab@gmail.com",
    password: "12345678",
    authentication: "login",
    enable_starttls_auto: true
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"