class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password])
      redirect_back_or_to(inicial_path, notice: 'Autenticado.')
    else
      flash.now[:alert] = 'Login falhou!'
      render action: 'new'
    end
  end

  def destroy
    #if logged_in? 
      logout
    #end
    redirect_to(root_path, notice: 'Desconectado!')
  end
end
