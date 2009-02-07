class BearShoutsController < ApplicationController
  # GET /bear_shouts
  # GET /bear_shouts.xml
  def index
    @bear_shouts = BearShout.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bear_shouts }
    end
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

  # GET /bear_shouts/1/edit
  def edit
    @bear_shout = BearShout.find(params[:id])
  end

  # POST /bear_shouts
  # POST /bear_shouts.xml
  def create
    @bear_shout = BearShout.new(params[:bear_shout])

    respond_to do |format|
      if @bear_shout.save
        flash[:notice] = 'BearShout was successfully created.'
        format.html { redirect_to(@bear_shout) }
        format.xml  { render :xml => @bear_shout, :status => :created, :location => @bear_shout }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bear_shout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bear_shouts/1
  # PUT /bear_shouts/1.xml
  def update
    @bear_shout = BearShout.find(params[:id])

    respond_to do |format|
      if @bear_shout.update_attributes(params[:bear_shout])
        flash[:notice] = 'BearShout was successfully updated.'
        format.html { redirect_to(@bear_shout) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bear_shout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bear_shouts/1
  # DELETE /bear_shouts/1.xml
  def destroy
    @bear_shout = BearShout.find(params[:id])
    @bear_shout.destroy

    respond_to do |format|
      format.html { redirect_to(bear_shouts_url) }
      format.xml  { head :ok }
    end
  end
end
