module Authentication
  def username
    cookies.signed[:user_id]
  end

  def username=(userid)
    cookies.signed[:user_id] = userid
  end

  def mode=(mode)
    cookies.signed[:mode] = mode.to_s
  end

  def edit_mode?
    cookies[:mode] ? cookies.signed[:mode] == "edit" : false
  end

  def can?(action = :view, object = nil)
    action == :create ? edit_mode? : true
  end

  def self.included(base)
    base.helper_method :username
    base.helper_method :can?
  end
end
