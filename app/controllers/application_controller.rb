class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    helper_method  :flash_class


    def flash_class(level)
      bootstrap_alert_class = {
        "success" => "alert-success",
        "error" => "alert-danger",
        "notice" => "alert-info",
        "alert" => "alert-danger",
        "warn" => "alert-warning"
      }
      bootstrap_alert_class[level]
    end

    def require_admin
      if current_user && current_user.admin == true
          return true
      else
          flash[:alert] = "Ony allowed to admins"
          redirect_to root_path
      end
    end


end
