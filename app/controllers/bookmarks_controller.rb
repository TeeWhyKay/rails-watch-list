class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)
    # raise
    # @list = List.find(params[:list_id])
    # @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render template: "lists/show"
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
