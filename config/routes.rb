Conservatoriohvl::Application.routes.draw do
  resources :user_sessions, :users, :clientes, :professores, :alunos, :cursos, :salas, :horarios, :lecionam

  resources :matriculas do
    collection do
      get 'busca_professores', to: "matriculas#busca_professores"
      get 'busca_horarios', to: "matriculas#busca_horarios"
      get 'busca_horarios_teoria', to: "matriculas#busca_horarios_teoria"
      get "busca_dados_curso", to: "matriculas#busca_dados_curso"
      get "tipo_teoria", to: "matriculas#tipo_teoria"
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#welcome'

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  # Rotas passando o id via parametro para as controllers 
  get 'horario/:professor_id/disponivel' => 'horarios#new', as: :disponivel
  get 'lecionam/:curso_id/lecionar' => 'lecionam#new', as: :lecionar
  get 'matricula/:id/encerrar', to: 'matriculas#encerrar', as: :encerrar

  get 'inicial', to: "funcionalidades#inicial"
  get 'notificacao_lida', to: "funcionalidades#notificacao_lida"
  post 'remove_sala', to: "horarios#remove_sala"
  get 'funcionalidades/index', to: "funcionalidades#index", as: :funcionalidades
  get 'encerradas', to: "matriculas#encerradas"
  get 'aluno/busca_dados_cliente', to: "alunos#busca_dados_cliente"
  get 'matricula_nova', to: "matriculas#new"
  get 'matricula_extra', to: "matriculas#new"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
