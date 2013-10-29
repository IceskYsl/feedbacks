class FeedbacksController < ApplicationController
  model_object Feedback

  unloadable
  
  def load_feedbacks
    feedbacks_scope = Feedback.where("status = 0")
    if @user_id && @user_id.to_i > 0
      feedbacks_scope = feedbacks_scope.where(:user_id => @user_id)
    end
    feedbacks_scope = feedbacks_scope.order("week desc,id desc")
    @limit =  Setting.plugin_worklogs['WORKLOGS_PAGINATION_LIMIT'].to_i || 20
    
    @feedbacks_count = feedbacks_scope.count
    @feedbacks_pages = Paginator.new @feedbacks_count, @limit, params['page']
    @offset ||= @feedbacks_pages.offset
    @feedbacks = feedbacks_scope.all(    :order => "#{Feedback.table_name}.created_at DESC",
                                       :offset => @offset,
                                       :limit => @limit)
  end

  def index
    load_feedbacks
  end
  
  def my
    @user_id = session[:user_id]
    @day = params[:day]
    load_feedbacks
    render :action => :index
  end
  
  def new
    @day = Date.today
    @feedback = Feedback.new() 
    scope = User.logged.status(1)
    @users =  scope.order("id desc").all     
  end
  
  def create
    @feedback = Feedback.new(params[:feedback])
    @feedback.day = Date.today
    @feedback.week = Date.today.strftime("%W").to_i
    @feedback.author = User.current
    @feedback.leader_id = User.current.id
    @feedback.save
    redirect_to feedbacks_path()
  end
  
end
