class PagesController < ApplicationController

  def home
  end

  def about
  end

  def contact
    @members = ['Alec']
  end

  def dashboard
    @now=Time.now
    @next_month=@now.next_month
    @month=@now.to_date.month
    @day=@now.to_date.day
    @level_now=generate_date(@month,@day)
    @level_next=generate_date(@next_month,@day)
    @relations = Relation.where('user_id=? ', current_user.id).order(date_of_birth: :ASC)
    @sorting_hobbies=Relation.joins(" INNER JOIN hobbies ON hobbies.id=relations.hobbies_id").select(
    'relations.*, hobbies.name as hobby_name').where('relations.user_id=? and relations.date_of_birth>? and
    relations.date_of_birth<?',current_user.id.to_s, @level_now, @level_next).order(date_of_birth: :ASC).limit(2)
    @sorting_relations=Relation.joins(" INNER JOIN relationships ON relationships.id=relations.relation_to").select(
      'relations.*, relationships.name as relationship_name').where('relations.user_id=? and relations.date_of_birth>? and
    relations.date_of_birth<?',current_user.id.to_s, @level_now, @level_next ).order(date_of_birth: :ASC).limit(2)
    # @t="2021-04-03".to_time
    # puts @now
    @product_list= Product.joins(" INNER JOIN relations ON relations.hobbies_id=products.hobby_id").select(
      'products.*').where('relations.user_id='+current_user.id.to_s )
    @first_relation=Relation.select('*').where('relations.user_id=? and relations.date_of_birth>? and
    relations.date_of_birth<?',current_user.id.to_s, @level_now, @level_next).order(date_of_birth: :ASC).limit(1).first
    if @first_relation
      @first_id=@first_relation.id
      puts "first_id===>", @first_id
      @first_products=Product.joins("INNER JOIN relations ON relations.hobbies_id=products.hobby_id and relations.gender=
        products.gender and relations.price_range> products.price").select(
        'products.*').where('relations.id='+@first_id.to_s)
      @second_relation=Relation.select('*').where('relations.user_id=? and relations.date_of_birth>? and
      relations.date_of_birth<?',current_user.id.to_s, @level_now, @level_next).order(date_of_birth: :ASC).limit(2).last
      if @second_relation
        @second_id=@second_relation.id
        puts "second_id===>", @second_id
        @second_products=Product.joins("INNER JOIN relations ON relations.hobbies_id=products.hobby_id and relations.gender=
        products.gender and relations.price_range> products.price").select(
          'products.*').where('relations.id=?',@second_id.to_s)
      end
    end

    @t=Time.now
    @level=@t.strftime("%Y/%m/%d")
    @holidays=Holiday.where('real_date> ?', @level).order(real_date: :ASC).limit(5)
    # puts @sorting_relations
    # puts @sorting_hobbies
  end

  def relationprofile
    @id=params[:id]
    @relations = Relation.where(id:@id).first
    @birthday=@relations.date_of_birth.to_date

    @hobby=Hobby.where(id:@relations.hobbies_id).first.name
    @relation_name=Relationship.where(id:@relations.relation_to).first.name
    @products=Product.joins("INNER JOIN relations ON relations.hobbies_id=products.hobby_id and relations.gender=
        products.gender and relations.price_range> products.price").select(
      'products.*').where('relations.id='+@id)
    puts  @relations.relation_to
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
