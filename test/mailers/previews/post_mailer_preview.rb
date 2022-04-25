class PostMailerPreview < ActionMailer::Preview
  def new_post_email
    post = Post.new(author: 'George', title: 'Test title', body: 'some usefull text')

    PostMailer.with(post: post).new_post_email
  end
end
