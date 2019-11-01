class ProductsController < RankingController
  before_action :authenticate_user!, only: :search
  
  def index
    # productsテーブルから最新順に作品を２０件取得する
    @products = Product.all.order("id ASC").limit(20)
  end

  def show
    # productsテーブルから該当するidの作品情報を取得し@productの変数へ代入する処理を書いて下さい
    @product = Product.find(params[:id])
  end

  def search
    keyword = "%#{params[:keyword]}%"
    @products = Product.find_by_sql(["select * from products where title like ? LIMIT 20", keyword])
  end
end
