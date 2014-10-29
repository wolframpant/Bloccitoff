class TodosController < ApplicationController
  
  def index
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
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

