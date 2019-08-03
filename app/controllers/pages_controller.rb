class PagesController < ApplicationController
  layout 'admin' #by default use application.html.erb 
  
  

  before_action :confirm_logged_in #see the applicationController 

  before_action :find_subject
  before_action :find_subjects , :only => [:new, :create, :edit, :update]# @subjects =  Subject.sorted
  before_action :set_page_count , :only => [:new, :create, :edit, :update]# @subjects =  Subject.sorted

  def index
    @pages = @subject.pages.sorted #return all but sorted lambda scope 
  end

  def show
    @page = @subject.pages.find(params[:id])
  end

  def new
    # @page = Page.new({:name => "Default"})
    @page = Page.new(:subject_id => @subject.id, :name => "Default")
    
    # @subjects =  Subject.sorted #no need any more because we have aciton filter for that 
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:notice] = "Page is successfully Created"
      redirect_to(pages_path(:subject_id => @subject.id))
    else 
      # @subjects =  Subject.sorted
      render 'new'
  end
end

  def edit
    @page = Page.find(params[:id])
    # @page_count = Page.count
    # @subjects =  Subject.sorted
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      flash[:notice] = "Page is successfully updated"
      redirect_to(page_path(@page, :subject_id => @subject.id))
    else
      # @page_count = Page.count
    # @subjects =  Subject.sorted
      render('edit')
  end
end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])

    @page.destroy
    flash[:notice] = "Page is successfully Deleted"
    redirect_to(pages_path(:subject_id => @subject.id))

  end


  private
  def page_params
    params.require(:page).permit(:subject_id, :name ,:permalink,:position, :visible)
  end

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end
  def find_subjects
    @subjects =  Subject.sorted
  end
  def set_page_count
    # i am creating a new section and it gives me a position for select out of 7 
    # but on that page i have only two how to tackle this and it is important that we have find_subject action before this 
    #@page_count = Page.count
    @page_count = @subject.pages.count
    if params[:action] ==  'new' || params[:action] == 'create'
      @page_count += 1
    end
  end
end
