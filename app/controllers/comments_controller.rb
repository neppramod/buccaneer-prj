class CommentsController < ApplicationController
  def create
    @person = Person.find(params[:person_id])
    @comment = @person.comments.create(comment_params)
    redirect_to person_path(@person)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
