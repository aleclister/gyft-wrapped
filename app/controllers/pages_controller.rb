class PagesController < ApplicationController

  def home
  end

  def about
  end

  def contact
    @members = ['Alec']
  end
  

  def relationprofile
    @id=params[:id]
    @relations = Relation.where(id:@id).first
    if current_user.present?
      if current_user.id==@relations.user_id
        @birthday=@relations.date_of_birth.to_date
        @hobbies_id=Relation.where(id:@id).first.hobbies_id
        puts "hobbies===>", @hobbies_id
        @format='('+@hobbies_id+')'
        @hobbies=Hobby.where("id in " + @format).all
        @relation_name=Relationship.where(id:@relations.relation_to).first.name
        @from=Price.joins("INNER JOIN relations ON prices.id=relations.price_range").where('relations.id='+
                                                                                             @id.to_s).first.from_price
        @to=Price.joins("INNER JOIN relations ON prices.id=relations.price_range").where('relations.id='+
                                                                                           @id.to_s).first.to_price
        @products=Product.joins("INNER JOIN relations ON  relations.gender=products.gender").where('relations.id='+ @id.to_s +
                                                                                                     ' and  products.hobby_id in'+@format +' and products.price>? and products.price<?', @from, @to)
        puts  @relations.relation_to
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end



  end

  

end