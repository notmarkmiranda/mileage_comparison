module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user
    end

    private

    def find_user
      User.find_by(dashboard_token: cookies[:user_cookie]) unless cookies[:user_cookie].nil?
    end
  end
end
