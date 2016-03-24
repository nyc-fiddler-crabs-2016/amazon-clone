class  ReviewsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @review = Review.new(review_params)
    if logged_in?
      if @review.save
        current_user.reviews << @review
        @item.reviews << @review
        flash[:notice] = "Thanks for your review!"
        redirect_to :back
      else

       flash[:notice] = "Something went wrong with your review"
       redirect_to :back
     end


    else
       flash[:notice] = "Please log in"
       redirect_to :back
   end
end

end


 def review_params
    params.require(:review).permit(:rating, :body, :item_id)
  end

