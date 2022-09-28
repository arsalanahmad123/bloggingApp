class RegistrationsController < Devise::RegistrationsController

    def new
        @user = User.new    
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path
        else
            flash[:error] = "There was something error !!!!"
            redirect_to new_user_registration_path
        end
    end

    private

        def user_params
            params.require(:user).permit(:username,:email,:password,:password_confirmation)
        end

end