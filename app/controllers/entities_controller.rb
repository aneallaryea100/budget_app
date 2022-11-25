class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entity, only: %i[show edit update destroy]

  def index
    @entities = Entity.all
  end

  def new
    @users = current_user.name
    @entity = Entity.new
    @group = current_user.groups
    @group_items = []
    @group.map do |group|
      @group_items << [group.name, group.id]
    end
  end

  def create
    @entity = Entity.new(set_entity_params)
    @entity.user_id = current_user.id

    if @entity.save
      redirect_to group_path(@entity.group_id)
    else
      render 'new'
    end
  end

  private

  def set_entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end

  def set_entity
    @entity = Entity.find(params[:id])
  end
end
