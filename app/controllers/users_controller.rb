class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(users_params)
        @user.save
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(users_params)
            flash[:notice] = '회원정보 수정이 완료되었습니다.'
            redirect_to edit_user_path
        end
    end

    def password_edit
        @user = User.find(params[:id])
    end

    def password_update
        @user = User.find(parmas[:id])
        if @user.update(password_params)
            flash[:success] = "비밀번호 변경이 완료되었습니다."
        end
    end

    private
    def users_params
        params.require(:user).permit(User.attribute_names + [:password, :password_confirmation])
    end

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end
