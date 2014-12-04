class ClassesController < ApplicationController
  def index
    @classes = Classe.all
  end

  def show
  end

  def new
    @classe = Classe.new
  end

  def edit
  end

  def create
    @classe = Classe.new(classe_params)

    respond_to do |format|
      if @classe.save
        format.html { redirect_to @classe, notice: "classe criada com sucesso." }
        format.json { render action: 'show', status: :created, location: @classe }
      else
        format.html { render action: 'new' }
        format.json { render json: @classe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @classe.update(classe_params)
        format.html { redirect_to @classe, notice: "Dados do classe foram atualizados com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @classe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @classe.destroy
    respond_to do |format|
      format.html { redirect_to classees_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classe
      @classe = Classe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classe_params
      params.require(:classe).permit(:idaluno, :idcurso, :idclasse, :data_classe, :termino_classe, 
        :semestre, :valor_mensal)
    end

end
