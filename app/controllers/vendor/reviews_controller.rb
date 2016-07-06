class Vendor::ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.vendor = Vendor.find_by(slug: params[:vendor_slug])
    if @review.save
      redirect_to vendor_show_path(@review.vendor.slug)
    else
      flash[:notice] = "Review could not be saved"
      redirect_to vendor_show_path(@review.vendor.slug)
    end
  end

  private

  def review_params
    params.require(:review).permit(:author_name, :body)
  end
end
