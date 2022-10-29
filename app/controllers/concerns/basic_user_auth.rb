module BasicUserAuth
  def authenticate_user!
    @login = request.headers[:login]
    @password = request.headers[:password]

    return head(:unauthorized) unless valid_credentials?
  end

  def valid_credentials?
    return false unless @login.present? && @password.present?
    return false unless @login == ENV['USER_LOGIN']
    return false unless @password == ENV['USER_PASSWORD']

    true
  end
end