class PostMailer < ApplicationMailer

  def new_post_email
    @user = params[:user]
    @post = params[:post]
    mail(to: @user.email, subject: 'Post created')
  end
end
