class BooksController < ApplicationController
  before_action :authenticate_user!
  # 応用2-6 上記を追記
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  # 応用2-29 他人が投稿した編集ページに飛ばないよう上記を追記

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
    # 応用2-22 showのrender先のformが@bookになってしまうと保存してある情報を参照し、編集フォームになるので新規に@book_new変数を追記
  end

  def index
    @books = Book.all
    @book = Book.new
    # 応用2-17 books/index.html.erbでは@bookを使用しているのに対してこちらのindexアクション内では定義されていない為、@book=Book.newを記載
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      render "index"
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  # 応用2-23 本来destroyアクションがdeleteになっているので修正

  private

  def book_params
    params.require(:book).permit(:title, :body)
    # 応用2-19 ストロングパラメータはここで指定されたカラム名しか許可しないとのことなので今回はpermit部分に:bodyを追記
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
  # 応用2-29 他人が投稿した編集ページに飛ばないよう上記を追記

end
