Conservatoriohvl::Application.routes.draw do
  resources :user_sessions, :users, :clientes, :professores, :alunos, :cursos, :salas, :horarios, :lecionam, :circulares

  resources :matriculas do
    collection do
      get 'busca_professores', to: "matriculas#busca_professores"
      get 'busca_horarios', to: "matriculas#busca_horarios"
      get 'busca_horarios_teoria', to: "matriculas#busca_horarios_teoria"
      get 'busca_dados_curso', to: "matriculas#busca_dados_curso"
      get 'tipo_teoria', to: "matriculas#tipo_teoria"
     end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#welcome'

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  get 'horario/:professor_id/disponivel' => 'horarios#new', as: :disponivel
  post 'remove_sala', to: "horarios#remove_sala"
  get 'lecionam/:curso_id/lecionar' => 'lecionam#new', as: :lecionar
  get 'inicial', to: "funcionalidades#inicial"
  get 'notificacao_lida', to: "funcionalidades#notificacao_lida"
  get 'ler_notificacoes', to: "funcionalidades#ler_notificacoes"
  get 'funcionalidades/index', to: "funcionalidades#index", as: :funcionalidades
  get 'valor_boletos', to: "funcionalidades#valor_boletos"
  get 'salario_professores', to: "funcionalidades#salario_professores"
  get 'salvar_folha', to: "funcionalidades#salvar_folha"
  get 'aluno/busca_dados_cliente', to: "alunos#busca_dados_cliente"
  get 'alunos_inativos', to: "alunos#inativos"
  get 'clientes_inativos', to: "clientes#inativos"
  get 'professores_inativos', to: "professores#inativos"
  get 'matricula_nova', to: "matriculas#new"
  get 'matricula_extra', to: "matriculas#new"
  get 'matriculas_encerradas', to: "matriculas#encerradas"
  post 'refaz_contrato', to: "matriculas#refaz_contrato"
  post 'circular_vigente', to: "circulares#circular_vigente"
  get 'professor/:id/controlar_horarios' => 'professores#controlar_horarios', as: :controlar_horarios
  get 'professor/:id/listar_alunos' => 'professores#listar_alunos', as: :listar_alunos
  get 'professor/:horario_id/alunos_horario' => 'professores#alunos_horario', as: :alunos_horario
  get 'visualiza_folha', to: "funcionalidades#visualiza_folha"
  get 'rematricular', to: "matriculas#rematricular"
  get 'rematricular_base', to: "matriculas#rematricular_base"
  get 'reativar_matricula/:id', to: "matriculas#reativar_matricula", as: :reativar_matricula
  get 'reativar_cliente/:id', to: "clientes#reativar_cliente", as: :reativar_cliente

end
