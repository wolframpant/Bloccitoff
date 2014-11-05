class TodosController < ApplicationController
  
  def index
    @todos = current_user.todos
  end

  def destroy
    @todo = Todo.find params[:id]
    if @todo.destroy 
      redirect_to todos_path
      flash[:notice] = "Your completed Todo has been deleted."
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
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.description?
      @todo.save
      redirect_to @todo, notice: 'Your new TODO was saved'
    else
      flash[:notice] = 'You forgot to enter a description'
      render :new
    end
  end

  def show
    @todo = Todo.find params[:id]
  end

  
  private

  def todo_params
    params.require(:todo).permit(:description)
  end

end

