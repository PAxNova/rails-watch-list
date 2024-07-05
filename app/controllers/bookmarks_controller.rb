class BookmarksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      @bookmarks = @list.bookmarks
      @movies = Movie.all
      render 'lists/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.list, notice: 'Bookmark was successfully deleted.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
