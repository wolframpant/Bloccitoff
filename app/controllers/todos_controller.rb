class TodosController < ApplicationController
  
  def index
    @todos = current_user.todos
    @todo = Todo.new
  end

  def destroy
    @todo = current_user.todos.find(params[:id])
    if @todo.destroy 
      redirect_to :back
      flash[:notice] = "Your completed Todo has been deleted from your list."
    else
      redirect to :back
      flash[:notice] = "There was an error completing your Todo. Please try again." 
    end
  end

  def update
    @todo = Todo.find params[:id]
    if @todo.update todo_params 
      redirect_to :back
      flash[:notice] = "Success!"
    else
      redirect_to :back
      flash[:notice] = "Please try again."
    end
  end

  def new
    @todo = Todo.new
    @lists = current_user.lists
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.valid?
      @todo.save
      redirect_to list_path(id:@todo.list_id), notice: 'Your new TODO was saved!'
    else
      flash[:notice] = 'You forgot to enter a description. Please try again.'
      redirect_to :back
    end
  end

  def show
    @todo = current_user.todos.find(params[:id])
  end

  
  private

  def todo_params
    params.require(:todo).permit(:description, :list_id)
  end

end

