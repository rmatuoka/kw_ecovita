class UsersController < ApplicationController
  layout "interna"
  before_filter :load_site_categories, :load_cart
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to accounts_path, :notice => "Usuário Cadastrado com Sucesso!"
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
      redirect_to accounts_path, :notice  => "Dados do usuário alterados!"
    else
      render :action => 'edit'
    end
  end
end
