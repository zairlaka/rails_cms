class PagesController < ApplicationController
  layout 'admin' #by default use application.html.erb 
  
  before_action :confirm_logged_in #see the applicationController 

  befoer_action :find_subject
  before_action :find_subjects , :only => [:new, :create, :edit, :update]# @subjects =  Subject.sorted
  before_action :set_page_count , :only => [:new, :create, :edit, :update]# @subjects =  Subject.sorted

  def index
    @pages = @subject.pages.sorted #return all but sorted lambda scope 
  end

  def show
    @page = @subject.pages.find(params[:id])
  end

  def new
    @page = Page.new({:name => "Default"})
    @page_count = Page.count + 1
    # @subjects =  Subject.sorted #no need any more because we have aciton filter for that 
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:notice] = "Page is successfully Created"
      redirect_to(pages_path)
    else 
      @page_count = Page.count + 1
      # @subjects =  Subject.sorted
      render 'new'
  end
end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
    # @subjects =  Subject.sorted
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      flash[:notice] = "Page is successfully updated"
      redirect_to(page_path(@page))
    else
      @page_count = Page.count
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
    redirect_to(pages_path)

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
    @page_count = Page.count
    if params[:action] ==  'new' || params[:action] == 'create'
      @page_count += 1
    end
  end
end
