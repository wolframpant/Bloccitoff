class RelationshipsController < ApplicationController
  
  def new
    @relationship = Relationship.new
  end
  
  def create
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      flash[:notice] = "Your collaborator was saved."
      redirect_to :back
    else
      flash[:notice] = 'Please try again.'
      redirect_to :back
    end
  end
  
  def destroy
    @relationship = Relationship.find(params[:id])
    authorize(@wiki)
    
    if @wiki.destroy
      flash[:notice] = "Your Wiki has been removed."
      redirect_to wikis_path
    else
      flash[:error] = "Wiki couldn't be deleted. Please try again."
      redirect_to wikis_path
    end

  end
  
  private
  
  def relationship_params
    params.require(:relationship).permit(:user_id, :wiki_id, :creator_created)
  end

end