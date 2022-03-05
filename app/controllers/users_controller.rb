class UsersController < ApplicationController
  before_action :authenticate_user!
  # 応用2-6 上記を追記
  before_action :ensure_correct_user, only: [:edit, :update]
  # 応用2-26 他ユーザーのプロフィールを編集できないようにensure_correct_userメソッドを使用。unlessはifの反対「もし〜でなければ」という意味

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end
  # 応用2-2 endが抜けていた

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
      # 応用2-15 users_pathだとindexページで引数は不要なのでsを除外
    else
      render "edit"
      # 応用2-16 編集が失敗した場合、showページへ飛んでしまうので、editに変更
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
