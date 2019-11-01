class RankingController < ApplicationController
  layout 'review_site'
  before_action :ranking
  def ranking
    ranking = Review.group(:product_id).order("count_product_id DESC").limit(5).count(:product_id).keys
    @ranking = ranking.map {|ele| Product.find(ele)}
  end
end
