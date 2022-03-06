class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.boo_id = book.id
    comment.save
    redirect_to book_path(book)
  end
  # 課題3 コメント実装 コメント機能ではcreateアクションを使用し、上記を追記

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end
  # 課題3 コメント実装 削除機能を実装するため上記を追記

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
# 課題3 コメント実装 カラム名commentを許可するため上記を追記
end
