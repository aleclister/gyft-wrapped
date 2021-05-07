class ProductsController < ApplicationController
  def show
    @id = params[:id]
    @show = Product.where("id="+ @id.to_s).first
    @hobby = Hobby.where(id:@show.hobby_id).first
    puts "product id===", @id
    puts "product", @show
  end



  def index
    if request.xhr?
      @product=Product.new
      @prices=Price.all
      @genders=Gender.all
      @ages=Age.all
      puts "there is ajax request!!!!!"
        if params[:hobby_id]
          if params[:hobby_id].present?
            puts "hobby_id", params[:hobby_id]
            @array_with_null=params[:hobby_id]
            @hobbies_array=@array_with_null.join(' ').split
            @hobbies=@hobbies_array.map(&:inspect).join(",")
            puts "hobbies", @hobbies
            @format='('+@hobbies+')'
            @products=Product.where("hobby_id in "+ @format)

          else
            @products=Product.all
          end

        end
        if params[:price]
          puts "price_id", params[:price]
          @products=Product.joins("INNER JOIN prices ON prices.from_price<= products.price and prices.to_price>=products.price ").where(
            "prices.id=?", params[:price])
          puts "products_by_price", @products

        end
        if params[:age]
          puts "age_id", params[:age]
          @products=Product.where(age: params[:age]);

        end
        if params[:gender]
          @products=Product.where(gender: params[:gender]);
          puts "gender_id", params[:gender]
        end
      respond_to do |format|
          format.js { render json: { html: render_to_string(partial: 'data_stats', locals: { products: @products}) } }
      end
    else
      @product=Product.new
      @prices=Price.all
      @genders=Gender.all
      @ages=Age.all
      @products=Product.all
    end
  end
end
