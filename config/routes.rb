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
  get 'aluno/busca_dados_cliente', to: "alunos#busca_dados_cliente"
  get 'alunos_inativos', to: "alunos#inativos"
  get 'clientes_inativos', to: "clientes#inativos"
  get 'professores_inativos', to: "professores#inativos"
  get 'matricula_nova', to: "matriculas#new"
  get 'matricula_extra', to: "matriculas#new"
  get 'matriculas_encerradas', to: "matriculas#encerradas"
  get 'matricula/:id/encerrar', to: 'matriculas#encerrar', as: :encerrar
  post 'refaz_contrato', to: "matriculas#refaz_contrato"
  post 'circular_vigente', to: "circulares#circular_vigente"

end
