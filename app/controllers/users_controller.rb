class UsersController < ApplicationController
	def dashboard
    @now=Time.now
    @next_month=@now.next_month
    @month=@now.to_date.month
    @day=@now.to_date.day
    @level_now=generate_date(@month,@day)
    @level_next=generate_date(@next_month,@day)
    @relations = Relation.where('user_id=? ', current_user.id).order(date_of_birth: :ASC)
    @sorting_relations=Relation.joins(" INNER JOIN relationships ON relationships.id=relations.relation_to").select(
      'relations.*, relationships.name as relationship_name').where('relations.user_id=? and relations.date_of_birth>? and
    relations.date_of_birth<?',current_user.id.to_s, @level_now, @level_next ).order(date_of_birth: :ASC).limit(2)
    # @t="2021-04-03".to_time
    # puts @now
    @first_relation=Relation.select('*').where('relations.user_id=? and relations.date_of_birth>? and
    relations.date_of_birth<?',current_user.id.to_s, @level_now, @level_next).order(date_of_birth: :ASC).limit(1).first
    if @first_relation
      @first_id=@first_relation.id
      @hobbies_id1=Relation.where(id:@first_id).first.hobbies_id
      puts "first_hobbies===>", @hobbies_id1
      @format1='('+@hobbies_id1+')'
      @hobbies1=Hobby.where("id in " + @format1).all

      @from1=Price.joins("INNER JOIN relations ON prices.id=relations.price_range").where('relations.id=' +
      @first_id.to_s).first.from_price
      @to1=Price.joins("INNER JOIN relations ON prices.id=relations.price_range").where('relations.id='+
      @first_id.to_s).first.to_price
      puts "from--to", @from1, @to1
      @first_products=Product.joins("INNER JOIN relations ON  relations.gender=products.gender").where('relations.id='+ @first_id.to_s +
       ' and  products.hobby_id in'+@format1 +' and products.price>? and products.price<?', @from1, @to1)
      @second_relation=Relation.select('*').where('relations.user_id=? and relations.date_of_birth>? and
      relations.date_of_birth<?',current_user.id.to_s, @level_now, @level_next).order(date_of_birth: :ASC).limit(2).last
      if @second_relation && @second_relation!=@first_relation
        @second_id=@second_relation.id
        @hobbies_id2=Relation.where(id:@second_id).first.hobbies_id
        puts "second_hobbies===>", @hobbies_id2
        @format2='('+@hobbies_id2+')'
        @hobbies2=Hobby.where("id in " + @format2)
        @from2=Price.joins("INNER JOIN relations ON prices.id=relations.price_range").where('relations.id='+
        @second_id.to_s).first.from_price
        @to2=Price.joins("INNER JOIN relations ON prices.id=relations.price_range").where('relations.id='+
        @second_id.to_s).first.to_price
        @second_products=Product.joins("INNER JOIN relations ON  relations.gender=products.gender").where('relations.id='+ @second_id.to_s +
        ' and  products.hobby_id in'+@format2 +' and products.price>? and products.price<?', @from2, @to2)
      end
    end

    @t=Time.now
    @level=@t.strftime("%Y-%m-%d")
    @holidays=Holiday.where('real_date> ?', @level).order(real_date: :ASC).limit(5)
    # puts @sorting_relations
    # puts @sorting_hobbies
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
