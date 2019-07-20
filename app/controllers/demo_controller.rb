class DemoController < ApplicationController
  def index
    # render(hello)
  end
  
  def hello 
    @array = [1,2,3,4,5]
    @id = params['id']
    @name = params[:name]
    render(index)
  end

  def other
    redirect_to(:controller => 'demo' , :action => 'index')
  end
end
