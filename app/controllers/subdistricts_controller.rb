class SubdistrictsController < ApplicationController
 
        # skip_before_action :verify_authenticity_token
        before_action :find_subdis, only: %i[destroy show update]
        before_action :verify_authenticity_token, except: [:index]
        # method to create API to show all subdis from table
        def index
          subdis = Subdistrict.all
          if subdis.present?
            render json: { status: 'OK', results: subdis, error: nil }, status: :ok
          else
            render json: {
              status: 'FAIL', results: nil, error: 'Data is empty'
            }, status: :unprocessable_entity
          end
        end
      
        # method to show specific subdis
        def show
          @subdis = Subdistrict.find(params[:id])
          if @subdis.present?
            data = @sudis.as_json(only:[:name], include: %i[only:[:name][district province]])
            render json: {
              status: 'OK', results: data, error: nil
            }, status: :ok
          else
            not_process
          end
        end
      
        # method to save new subdis
        def create
          subdis = Subdistrict.new(subdis_params)
          if subdis.save
            subdis.reload
            render json: {
              status: 'OK', results: subdis, error: nil
            }, status: :created
          else
            not_process
          end
        end
      
        # method to update subdis that have exist
        def update
          @sudis = Subdistrict.find(params[:id])
          update_subdis = @sudis.update(subdis_params)
          if update_subdis
            render json: {
              status: 'OK', results: update_subdis, error: nil
            }, status: :ok
          else
            not_auth
          end
        end
      
        # method to delete subdis base on id
        def destroy
          if @sudis == Subdistrict.find(params[:id])
            @sudis.destroy!
            render json: {
              status: 'OK', results: 'Delete success', error: nil
            }, status: :ok
          else
            not_process
          end
        end
      
        private
      
        def not_process
          render json: {
            status: 'FAIL', results: nil, error: 'Data fail to process'
          }, status: :unprocessable_entity
        end
      
        def find_subdis
          @sudis = Subdistrict.find(params[:id])
        end
      
        def subdis_params
          params.permit(:kecamatan_id, :subdis_type, :name, :photo)
        end
      
end
