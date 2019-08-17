module Api
    module V1
        class SubjectsController < ApplicationController
  # skip_before_filter :verify_authenticity_token, if: :json_request? #For some reason I'm getting an InvalidAuthenticityToken when making post requests to my application when using json
   skip_before_action :verify_authenticity_token########  WARNING is this secure??

  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.5'

            def index
                subjects = Subject.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Loaded Subjects', data:subjects},status: :ok
            end

            def show
                subject = Subject.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded Subject', data:subject},status: :ok
            end
            def create
                subject = Subject.new(subject_params)
                if subject.save
                    render json: {status: 'SUCCESS', message: 'Saved Subject', data:subject},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Subject not saved', data:subject.errors},status: :unprocessable_entity
                end
            end
            def destroy
                subject = Subject.find(params[:id])
                subject.destroy
                render json: {status: 'SUCCESS', message: 'Deleted Subject', data:subject},status: :ok
            end
            def update
                subject = Subject.find(params[:id])
                if subject.update_attributes(subject_params)
                    render json: {status: 'SUCCESS', message: 'Update Subject', data:subject},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Subject not update', data:subject.errors},status: :unprocessable_entity
                end
            end

            private

            def subject_params
                params.require(:subject).permit(:name, :position, :visible)
            end
# PATCH/PUT /posts/1
# PATCH/PUT /posts/1.json
#   def update
#     respond_to do |format|
#       if @post.update(post_params)
#         format.html { redirect_to @post, success: 'Post was successfully updated.' }
#         format.json { render :show, status: :ok, location: @post }
#       else
#         format.html { render :edit }
#         format.json { render json: @post.errors, status: :unprocessable_entity }
#       end
#     end
#   end

        end
    end
end