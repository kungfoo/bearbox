class BearShoutsController < ApplicationController
  
  layout "bear_shouts", :except => [:rss]
  
  # GET /bear_shouts
  # GET /bear_shouts.xml
  def index
    # @bear_shouts = BearShout.find(:all, :order => "created_at DESC")
    @bear_shouts = BearShout.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.rss { render :layout => false }
      format.xml  { render :xml => @bear_shouts }
    end
  end
  
  # GET /bear_shouts/rss
   # GET /bear_shouts/rss.xml
   def rss
     @bear_shouts = BearShout.find(:all, :limit => 10, :order => 'created_at DESC')
   end

  # GET /bear_shouts/1
  # GET /bear_shouts/1.xml
  def show
    @bear_shout = BearShout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bear_shout }
    end
  end

  # GET /bear_shouts/new
  # GET /bear_shouts/new.xml
  def new
    @bear_shout = BearShout.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bear_shout }
    end
  end

#  # GET /bear_shouts/1/edit
#  def edit
#    @bear_shout = BearShout.find(params[:id])
#  end

  # POST /bear_shouts
  # POST /bear_shouts.xml
  def create
    @bear_shout = BearShout.new(params[:bear_shout])
    @bear_shout.date_added = DateTime.now()
    @bear_shout.rating = 0

    respond_to do |format|
      if verify_recaptcha(@bear_shout) && @bear_shout.save
        flash[:notice] = 'Your bearshout was successfully created.'
        format.html { redirect_to(:action => :index) }
        format.xml  { render :xml => @bear_shout, :status => :created, :location => @bear_shout }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bear_shout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bear_shouts/1
  # PUT /bear_shouts/1.xml
#  def update
#    @bear_shout = BearShout.find(params[:id])
#
#    respond_to do |format|
#      if @bear_shout.update_attributes(params[:bear_shout])
#        flash[:notice] = 'BearShout was successfully updated.'
#        format.html { redirect_to(@bear_shout) }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @bear_shout.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

#  # DELETE /bear_shouts/1
#  # DELETE /bear_shouts/1.xml
#  def destroy
#    @bear_shout = BearShout.find(params[:id])
#    @bear_shout.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(bear_shouts_url) }
#      format.xml  { head :ok }
#    end
#  end
end
