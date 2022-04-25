class SaveHistoryService
  def initialize(type, user)
    @type = type
    @user = user
  end

  def call
    History.create(type: @type, user: @user.email)
  end
end
