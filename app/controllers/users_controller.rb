class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create

        user=User.new(user_params)
        if user.save
            flash[:succes]="New user"
            redirect_to new_user_path
        else
            flash.now[:warning]="User not created"
            render 'new'  
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
