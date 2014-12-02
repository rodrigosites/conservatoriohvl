class LecionamController < ApplicationController

  def index
  end

  def show
  end

  def edit
  end

  # NEW referente a associação HABTM entre os modelos Curso e Professor
  def new
    @leciona = Leciona.new
  end

  # CREATE referente a associação HABTM entre os modelos Curso e Professor
  def create
    @leciona = Leciona.new(leciona_params)

    respond_to do |format|
      if @leciona.save
        format.html { redirect_to Curso.find(@leciona.curso_id), notice: "Vinculo criado com sucesso." }
        format.json { render action: 'show', status: :created, location: @leciona }
      else
        format.html { render action: 'leciona_new' }
        format.json { render json: @leciona.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    @leciona = Leciona.find(params[:id])
    @leciona.destroy
    respond_to do |format|
      format.html { redirect_to :back}
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
  def leciona_params
      params.require(:leciona).permit(:curso_id,:professor_id)
  end
end
