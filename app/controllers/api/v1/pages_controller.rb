module Api
    module V1
        class PagesController < ApplicationController
  # skip_before_filter :verify_authenticity_token, if: :json_request? #For some reason I'm getting an InvalidAuthenticityToken when making post requests to my application when using json
   skip_before_action :verify_authenticity_token########  WARNING is this secure??

  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.5'

            def index
                pages = Page.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Loaded Pages', data:pages},status: :ok
            end

            def show
                page = Page.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded Page', data:page},status: :ok
            end
            def create
                page = Page.new(page_params)
                if page.save
                    render json: {status: 'SUCCESS', message: 'Saved Page', data:page},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Page not saved', data:page.errors},status: :unprocessable_entity
                end
            end
            def destroy
                page = Page.find(params[:id])
                page.destroy
                render json: {status: 'SUCCESS', message: 'Deleted Page', data:page},status: :ok
            end
            def update
                page = Page.find(params[:id])
                if page.update_attributes(page_params)
                    render json: {status: 'SUCCESS', message: 'Update Page', data:page},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Page not update', data:page.errors},status: :unprocessable_entity
                end
            end

            private

            def page_params
                params.require(:page).permit(:subject_id, :name ,:permalink,:position, :visible)
            end
        end
    end
end