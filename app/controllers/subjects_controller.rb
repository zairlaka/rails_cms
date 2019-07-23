class SubjectsController < ApplicationController
  def index
    @subjects = Subject.sorted  #used lambda scope subject model
    #render('index') rails is smart no need for extra line to rails automatically go to index page of subject
  end

  def show
    #@subject = Subject.find(4) its not static so what 
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'}) #notic VISIBLE already have a false value because we gave it in database 
  end

  def create
    #steps
    #instantite a new object using form parameters
    #save object
    #if save succeed, redirects to the index action
    #if fails redisplay the form so user can fix the problems 

    #@subject = Subject.new(params[:subject]) #problem of mass assignment FORBIDEN ATTRIBUTES ERROR
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to(subjects_path)
    else
      render('new') #render just form template having already @subject and populate with old values which have validation error
      #user don't have to enter all that valus again 
    end
  end

  def edit
  end

  def upddate
  end

  def delete
  end

  def destroy
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
