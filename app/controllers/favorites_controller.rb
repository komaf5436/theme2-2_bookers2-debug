class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to book_path(book)
  end

end
# 課題3 いいね機能用にコントローラーを作成
# 課題3 いいね機能ではindex,showはつくらずbookの詳細画面に実装
