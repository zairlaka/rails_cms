class SubjectsController < ApplicationController
  layout 'admin'
  
  before_action :confirm_logged_in #see the applicationController 
  # GET /subjects
  # GET /subjects.json
  def index ################################################################
    @subjects = Subject.sorted  #used lambda scope subject model instead of Subject.all return randomly we want to return in sorted order
    @page_title = "All Subject"
    #render('index') rails is smart no need for extra line to rails automatically go to index page of subject
    #render json: {status: 'SUCCESS', message: 'Loaded Subjects', data:@subjects},status: :ok
  end
################################################################
  def show
    #@subject = Subject.find(4) its not static so what 
    #if you see the link we are sending query string == On the internet, a query string is the part of a uniform resource locator (URL) which assigns values to specified parameters. The query string commonly includes fields added to a base URL by a Web browser or other client application, for example as part of an HTML form.
    #like http://localhost:3000/subjects/1
    #we are catching id throug params[:id] this sending by index template
    @subject = Subject.find(params[:id]) #that make us to available to our template show 
  end
################################################################
  def new
    @subject = Subject.new({:name => 'Default'}) #notic VISIBLE already have a false value because we gave it in database 
    @subject_count = Subject.count + 1 
    #because we are adding a new one in this 
    #and not to forget to add in create else part because there we also render new that will not have this list and give you an error
  end
################################################################
  def create
    #steps
    #instantite a new object using form 
    #save object
    #if save succeed, redirects to the index action
    #if fails redisplay the form so user can fix the problems 

    #@subject = Subject.new(params[:subject]) #problem of mass assignment FORBIDEN ATTRIBUTES ERROR
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:notice] = "Subject created Successfully."
      redirect_to(subjects_path) #return us to the index page which show all the subjects
    else
      @subject_count = Subject.count + 1
      render('new') #render just form template having already @subject and populate with old values which have validation error
      #user don't have to enter all that valus again 
    end
  end
################################################################
  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end
################################################################
  def update
    #steps
    #find object using form parameters
    #update the object
    #if save succeed, redirects to the show action
    #if fails redisplay the form so user can fix the problems 

    #
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated Successfully."
      redirect_to(subject_path(@subject)) # return to detail view of that subject mean show   
    else
      @subject_count = Subject.count 
      render('edit') #render just form template having already @subject and populate with old values which have validation error
      #user don't have to enter all that valus again 
    end
  end
################################################################
  def delete
     @subject = Subject.find(params[:id])
  end
################################################################
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy #how ever we destroy this subject it is still available in frozen ruby object
    flash[:notice] = "Subject #{@subject.name} destroyed Successfully." 
    redirect_to(subjects_path)
  end
################################################################
  private
################################################################
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
