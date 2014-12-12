class FuncionalidadesController < ApplicationController
  def inicial
    @notificacoes = Notificacao.all
  end

  def notificacao_lida
    @notificacao = Notificacao.find(params[:id])
    @notificacao.update_attribute(:visualizado,true)

    respond_to do |format|
      format.js { head :ok }
    end
  end
  
end
