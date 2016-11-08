module App
  class API < Grape::API
    format :json

    resource :books do
      desc 'Return all books'
      get '/' do
        { title: 'Bojan', desc: 'Some another book'}
      end
    end

  end
end
