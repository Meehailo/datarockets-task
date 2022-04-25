class Post < ApplicationRecord
  belongs_to :user

  validates :title, :author, presence: true
  validates :body, presence: true, length: { minimum: 10 }  

  after_create :send_email_notification

  def send_email_notification
    PostMailer.with(post: self, user: user).new_post_email.deliver_later
  end
end
