class PasswordResetsController < ApplicationController
  layout "interna", :except => [:new, :create]
  def new
  
  end
  
	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.deliver_password_reset_instructions!
			UserMailer.send_email_password_reset(@user).deliver
			@sucess = true
			flash[:error] = "Foi enviado por e-mail a instrução de como alterar a sua senha."
		else
		  @sucess = false
			flash[:error] = "O e-mail digitado é invalido! Digite um e-mail válido."
		end
	end
	

	def edit
	  load_user_using_perishable_token
	  if !@user
	    @sucess = false
	    flash[:temerro] = " "
			flash[:error] = "O link expirou! Tente novamente."
			redirect_to login_path
		end
	end

	def update
	  load_user_using_perishable_token
	  if !@user
	      flash[:error] = "Ocorreu um erro!Tente novamente!"
  			render :action => :edit
	  else
    		@user.password = params[:user][:password]
    		@user.password_confirmation = params[:user][:password_confirmation]
    		if (@user.password != @user.password_confirmation)
    		  @sucess = false
    		  flash[:error_senha] = "Senha e Confirmação de Senha são diferente!"
    		  render :action => :edit
    		else
          if @user.save
            flash[:error] = "Senha alterada com sucesso!"
	          redirect_to login_path
          else
            @sucess = false
            flash[:temerro] = " "
            flash[:error] = "Ocorreu um erro tente novamente!"
	          redirect_to login_path
          end
    	  end
    end
	end

	private
	def load_user_using_perishable_token
		@user = User.find_using_perishable_token(params[:id], 3.hours.to_i)
	end
	
  
end
