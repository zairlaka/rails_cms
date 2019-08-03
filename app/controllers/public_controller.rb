class PublicController < ApplicationController
  layout 'public'

  before_action :setup_navigation

  def index
    # no need here just in template
  end
  def show
    @page = Page.visible.where(:permalink => params[:permalink]).first
    #we are getting here the page ralevant to the permalink and only if that is visible else nothing
    if @page.nil? 
      redirect_to(root_path)
    else
      #meaning we have now something @page and we can pass it throug template
      #display the show page  using this content we have 
    end

  end
private 

  def setup_navigation
    @subjects = Subject.visible.sorted
  end

end
