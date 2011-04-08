class UsersController < ApplicationController
  access_control do
    allow all, :to => [:create, :new]
    allow :admin, :to => [:edit]
    allow :supervisor, :to => [:edit]
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Usuário Cadastrado com Sucesso!"
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice  => "Dados do usuário alterados!"
    else
      render :action => 'edit'
    end
  end
end
