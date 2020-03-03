class CommentsController < ApplicationController
def show
    @commment = Comment.find(params[:id])
end

def new
    @comment = Comment.new
end

def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment successfully created"
      redirect_to portfolio_path(@comment.portfolio_id)
    else
      flash[:error] = "Something went wrong"
      render portfolio_path(@comment.portfolio_id)
    end
end

def edit
    @comment = Comment.find(params[:id])
end

def update
    @comment = Comment.find(params[:id])
    if @comment.update(params[:comment])
      flash[:success] = "Comment was successfully updated"
      redirect_to @comment
    else
      flash[:error] = "Something went wrong"
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
    params.require(:comment).permit(:title, :content, :user_id, :portfolio_id)
end

end
