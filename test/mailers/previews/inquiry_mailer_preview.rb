class InquiryMailerPreview < ActionMailer::Preview
    def inquiry
        inquiry = Inquiry.new(name: "侍 太郎", email: "test@gmail.com", kinds: "未分類", message: "問い合わせメッセージが入ります。お問い合わせですお問い合わせですお問い合わせですお問い合わせですお問い合わせです
          お問い合わせですお問い合わせですお問い合わせですお問い合わせですお問い合わせですお問い合わせですお問い合わせですお問い合わせですお問い合わせですお問い合わせですお問い合わせです
          お問い合わせですお問い合わせですお問い合わせですお問い合わせですお問い合わせです")
        InquiryMailer.received_email(inquiry)
    end
end