class ProductsController < ApplicationController
  def show
    @id=params[:id]
    @show= Product.where("id="+ @id.to_s).first
    @hobby=Hobby.where(id:@show.hobby_id).first
    puts "product id===", @id
    puts "product", @show
  end
end
