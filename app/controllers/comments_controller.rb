class CommentsController < ApplicationController
# def show
#     @commment = Comment.find(params[:id])
# end

  def new
      @comment = Comment.new
  end

  def create
      @comment = Comment.new(title: params[:title], content: params[:content], user_id: params[:user_id], portfolio_id: params[:portfolio_id])
      if @comment.save
        flash[:success] = "Comment successfully created"
        redirect_to portfolio_path(@comment.portfolio_id)
      else
        flash[:error] = "Something went wrong"
        redirect_to portfolio_path(@comment.portfolio_id)
      end
  end

  def edit
      @comment = Comment.find(params[:id])
  end

  def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        flash[:success] = "Comment was successfully updated"
        redirect_to portfolio_path(@comment.portfolio_id)
      else
        flash[:error] = "There was a problem editing this comment, please try again."
        redirect_to edit_comment_path(@comment)
      end
  end



  def destroy
      @comment = Comment.find(params[:id])
      if @comment.destroy
          flash[:success] = 'Comment was successfully deleted.'
          redirect_to portfolio_path(@comment.portfolio_id)
      else
          flash[:error] = 'Something went wrong'
          redirect_to portfolio_path(@comment.portfolio_id)
      end
  end

  private
  def comment_params 
    params.require(:comment).permit(:user_id, :title, :content, :portfolio_id)
  end

end
