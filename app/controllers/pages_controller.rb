class PagesController < ApplicationController

  def home
  end

  def about
  end

  def contact
    @members = ['Alec']
  end

  def dashboard

    @relations = Relation.where(user_id:current_user.id)

    @now=Time.now
    @next_month=@now.next_month.to_date
    @sorting_hobbies=Relation.joins(" INNER JOIN hobbies ON hobbies.id=relations.hobbies_id").select(
    'relations.*, hobbies.name as hobby_name').where('relations.user_id='+current_user.id.to_s )
    @sorting_relations=Relation.joins(" INNER JOIN relationships ON relationships.id=relations.relation_to").select(
      'relations.*, relationships.name as relationship_name').where('relations.user_id='+current_user.id.to_s )
    # @t="2021-04-03".to_time
    # puts @now
    @product_list= Product.joins(" INNER JOIN relations ON relations.hobbies_id=products.hobby_id").select(
      'products.*').where('relations.user_id='+current_user.id.to_s )
    @first_id=Relation.select('*').where(user_id:current_user.id).order(id: :ASC).limit(1).first.id
    @second_id=Relation.select('*').where('user_id='+current_user.id.to_s ).order(id: :ASC).limit(2).last.id
    @first_products=Product.joins("INNER JOIN relations ON relations.hobbies_id=products.hobby_id").select(
      'products.*').where('relations.id='+@first_id.to_s)
    @second_products=Product.joins("INNER JOIN relations ON relations.hobbies_id=products.hobby_id").select(
      'products.*').where('relations.id='+@second_id.to_s)
    puts @first_id, @second_id
    @month=@now.to_date.month
    @day=@now.to_date.day
    if @month<10
      @month_str='0' + @month.to_s
    else
      @month_str=@month.to_s
    end
    if @day<10
      @day_str='0' + @day.to_s
    else
      @day_str=@day.to_s
    end

    @level_date=@month_str+ "-" + @day_str
    puts @month, @day, @level_date
    @holidays=Holiday.select("*").where('real_date > ' + @level_date).order(real_date: :ASC).limit(4)
    puts @holidays
    # puts @sorting_relations
    # puts @sorting_hobbies
  end

  def relationprofile
    @id=params[:id]
    @relations = Relation.where(id:@id).first
    @date=@relations.date_of_birth
    @hobby=Hobby.where(id:@relations.hobbies_id).first.name
    @relation_name=Relationship.where(id:@relations.relation_to).first.name
    @products=Product.joins("INNER JOIN relations ON relations.hobbies_id=products.hobby_id").select(
      'products.*').where('relations.id='+@id)
    puts  @relations.relation_to, @date
  end


end
