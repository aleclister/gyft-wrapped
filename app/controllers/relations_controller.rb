class RelationsController < ApplicationController
  def index
    @relations = Relation.all
  end
  def add
    @relationships=Relationship.all
    @hobbies=Hobby.all
    @relation = Relation.new
  end
  def create
    @relation = Relation.new(user_params)
    if @relation.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def user_params
    params.require(:relation).permit(:first_name, :last_name, :date_of_birth, :gender, :relation_to,
    :hobbies_id, :price_range, :age ,:user_id)
  end
end
