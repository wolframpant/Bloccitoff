class ListsController < ApplicationController
  
  def new
    @list = List.new
  end
  
  def create
    @list = current_user.lists.build(list_params)
    if @list.valid?
      @list.save
      redirect_to lists_path, notice: 'Your new list was saved'
    else
      flash[:notice] = 'You forgot to enter a title. Please try again.'
      redirect_to :back
    end
  end
  
  def destroy
    @list = current_user.lists.find(params[:id])
    if @list.destroy 
      redirect_to lists_path
      flash[:notice] = "Your list has been deleted."
    else
      redirect to :back
      flash[:notice] = "There was an error deleting your list. Please try again." 
    end
  end
  
  def index
    @lists = current_user.lists
  end
  
  def show
    @list = List.find(params[:id])
    @cutoff = @list.cutoff
    if @list.todos.exists? then  
      @list.todos.each do |t|
        if t.age_of_todo > @cutoff then
          t.delete
        end
      end
    end
    @todos = @list.todos
    @todo = Todo.new
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title, :cutoff)
  end
      
end
