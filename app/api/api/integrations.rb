module API
  class Integrations < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json
    prefix :api

    resource :integrations do
      desc 'Return an integration.'
      params do
        requires :id, type: Integer, desc: 'Integration ID.'
      end
      route_param :id do
        get do
          integration = Integration.eager_load(connections: :field_mappings).find(params[:id])

          present integration, with: API::Entities::Integration
        end
      end
    end
  end
end
