require_relative 'models/user'

GrapeTokenAuth.setup! do |config|
  config.mappings = { user: User }
  config.secret   = '3fe397575565365108556c3e5549f139e8078a8ec8fd2675a83de96289b30550a266ac04488d7086322efbe573738e7b3ae005b2e3d9afd718aa337fa5e329cf'
end
