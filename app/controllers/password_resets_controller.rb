class PasswordResetsController < ApplicationController
#  layout "interna", :except => [:new, :create]
  layout "login"
  def new
  
  end
  
	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.deliver_password_reset_instructions!
			UserMailer.send_email_password_reset(@user).deliver
			flash[:notice] = "Foi enviado por e-mail a instrução de como alterar a sua senha."
			render :action => :new
		else
			flash[:notice] = "O e-mail digitado é invalido! Digite um e-mail válido."
			render :action => :new
		end

	end
	

	def edit
	  load_user_using_perishable_token
	  if !@user
			flash[:notice] = "O link expirou! Tente novamente."
			render :action => :new
		end
	end

	def update
	  load_user_using_perishable_token
	  if !@user
	      flash[:notice] = "Ocorreu um erro!Tente novamente!"
  			render :action => :edit
	  else
    		@user.password = params[:user][:password]
    		@user.password_confirmation = params[:user][:password_confirmation]
    		if (@user.password != @user.password_confirmation)
    		  flash[:notice] = "Senha e Confirmação de Senha são diferente!"
    		  render :action => :edit
    		else
          if @user.save
            flash[:notice] = "Senha alterada com sucesso!"
	          redirect_to root_path
          else
            flash[:notice] = "Ocorreu um erro tente novamente!"
	          render :action => :edit
          end
    	  end
    end

	end

	private
	def load_user_using_perishable_token
		@user = User.find_using_perishable_token(params[:id], 3.hours.to_i)
	end
	
  
end
