class RelationsController < ApplicationController
  def index
    @relations = Relation.all
  end
end
