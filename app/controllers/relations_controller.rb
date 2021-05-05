class RelationsController < ApplicationController
  # def index
  #   params[:tag] ? @relations = Relation.tagged_with(params[:tag]) : @relations = Relation.all
  # end
  def add
    @relationships=Relationship.all
    @hobbies=Hobby.all
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
