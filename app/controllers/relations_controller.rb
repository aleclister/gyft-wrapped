class RelationsController < ApplicationController
  # def index
  #   params[:tag] ? @relations = Relation.tagged_with(params[:tag]) : @relations = Relation.all
  # end
  def add
    @relationships=Relationship.all
    @hobbies=Hobby.all
    @genders=Gender.all
    @relation = Relation.new
    @prices=Price.all
  end
  def create
    @array_with_null=params[:relation][:hobbies_id]
    @hobbies_array=@array_with_null.join(' ').split
    @hobbies=@hobbies_array.map(&:inspect).join(",")
    @birthday=params[:relation][:date_of_birth]
    @month=@birthday.to_date.month
    @day=@birthday.to_date.day
    @date_of_birth=generate_date(@month,@day)
    @age=age(@birthday.to_date)
    @relation = Relation.new(user_params.merge(date_of_birth:@date_of_birth, age:@age, hobbies_id:@hobbies))
    # puts "birthday===>", @birthday, "dateofbirth==>", @month, @day, @date_of_birth, "age==>",@age
    if @relation.save
      redirect_to dashboard_path
    else
      render :new
    end
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

  

  def user_params
    params.require(:relation).permit(:first_name, :last_name,  :gender, :relation_to,
     :price_range,  :user_id)

  end

  def age(dob)
    now = Time.now.to_date
    return now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def generate_date(month, day)
    if month<10
      @month_str='0' + month.to_s
    else
      @month_str=month.to_s
    end
    if day<10
      @day_str='0' + day.to_s
    else
      @day_str=day.to_s
    end
    return @level_date=@month_str+ "/" + @day_str
  end
end
