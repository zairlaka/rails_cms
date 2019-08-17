module Api
    module V1
        class SectionsController < ApplicationController
  # skip_before_filter :verify_authenticity_token, if: :json_request? #For some reason I'm getting an InvalidAuthenticityToken when making post requests to my application when using json
   skip_before_action :verify_authenticity_token########  WARNING is this secure??

  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.5'

            def index
                sections = Section.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Loaded Sections', data:sections},status: :ok
            end

            def show
                section = Section.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded Section', data:section},status: :ok
            end
            def create
                section = Section.new(section_params)
                if section.save
                    render json: {status: 'SUCCESS', message: 'Saved Section', data:section},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Section not saved', data:section.errors},status: :unprocessable_entity
                end
            end
            def destroy
                section = Section.find(params[:id])
                section.destroy
                render json: {status: 'SUCCESS', message: 'Deleted Section', data:section},status: :ok
            end
            def update
                section = Section.find(params[:id])
                if section.update_attributes(section_params)
                    render json: {status: 'SUCCESS', message: 'Update Section', data:section},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Section not update', data:section.errors},status: :unprocessable_entity
                end
            end

            private

            def section_params
                params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
            end
        end
    end
end