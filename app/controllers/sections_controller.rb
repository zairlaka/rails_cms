class SectionsController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in #see the applicationController 

  before_action :find_page
  def index
    @sections = @page.sections.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:page_id => @page.id)
    @section_count = @page.sections.count + 1
    @pages =  Page.sorted
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      flash[:notice] = "Section Created Successfully"
      redirect_to(sections_path(:page_id => @page.id))
    else
      @section_count = @page.sections.count + 1
      @pages =  Page.sorted
      render "new"
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section Deleted Successfully"
    redirect_to(pages_path(:page_id => @page.id))
    
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = @page.sections.count
    @pages =  Page.sorted
  end
  def update
    @section = Section.find(params[:id])
    
    if @section.update_attributes(section_params)
      flash[:notice] = "Section Updated Successfully"
      redirect_to(section_path(@section , :page_id => @page.id))
    else
      @section_count = @page.sections.count
      @pages =  Page.sorted
      render 'edit'
    end
  end

private 

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end
  # find page count  implement in page controller and a one trick is there
  #i am creating a new section and it gives me a position for select out of 7 
  # but on that page i have only two how to tackle this 

  def find_page
    @page = Page.find(params[:page_id])
  end
end
