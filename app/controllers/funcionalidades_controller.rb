class FuncionalidadesController < ApplicationController
  def inicial
    @notificacoes = Notificacao.where("user_id = '#{current_user.id}'")
  end

  def index
    @notificacoes = Notificacao.where("user_id = '#{current_user.id}'")
  end

  def notificacao_lida
    @notificacao = Notificacao.find(params[:id])
    @notificacao.update_attribute(:visualizado,true)

    respond_to do |format|
      format.js { head :ok }
    end
  end
  
end
