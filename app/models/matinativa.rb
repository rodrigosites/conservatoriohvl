class Matinativa < ActiveRecord::Base
  #associações no banco de dados
  belongs_to :aluno
  belongs_to :curso

  def self.search(search, page)
    paginate :per_page => 10, :page => page,
             :joins => :aluno,
             :conditions => ['nome like ?', "%#{search}%"]
  end

  #Matinativa.where(termino_matricula: '11/01/2017'.to_date).each do |a|
   # a.update_attribute(:termino_matricula,Date.civil(2016,-1,-1))
  #end

  # busca as matriculas inativas unicas considerando :id_ativa e :data_matricula
  if ActiveRecord::Base.connection.table_exists? 'matinativas'
    matriculas_unicas = Matinativa.select("MIN(id) as id").group(:id_ativa,:data_matricula).collect(&:id)
    matriculas_unicas.each do |inativa|
      # para cada matricula inativa unica, verifica se existe alguma matricula ativa na mesma data
      if Matricula.where(id: Matinativa.find_by_id(inativa).id_ativa, data_matricula: Matinativa.find_by_id(inativa).data_matricula).size > 0
        # se houver, remove do array de matriculas unicas para exclusao ao final
        matriculas_unicas -= [inativa]
      end
    end
    # exclue todas as matriculas que nao passaram nos parametros acima
    Matinativa.where.not(id: matriculas_unicas).destroy_all
  end
end
