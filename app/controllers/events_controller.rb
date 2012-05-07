class EventsController < ApplicationController
  # GET /events
  # GET /events.json

  before_filter :check_admin, :except => [:index, :show, :suggest_cafes, :rank]

  def rank
    @event = Event.find(params[:id])

    if params[:suggestions]
      for suggestion in @event.suggestions

        ranking = Ranking.where(:suggestion_id => suggestion.id, :guest_id => current_user.id).first

        if ranking
          if params[:suggestions][suggestion.id.to_s]
            ranking.value = params[:suggestions][suggestion.id.to_s]
          else
            ranking.value = 0
          end
          ranking.save
        else
          ranking = Ranking.create(:suggestion_id => suggestion.id, 
                                  :guest_id => current_user.id, 
                                  :value => params[:suggestions][suggestion.id.to_s])
        end
      end
      redirect_to event_path(@event)
    end
  end


  def suggest_cafes
    @event = Event.find(params[:id])

    if params[:suggestions] and params[:suggestions][:cafes]
      for id in params[:suggestions][:cafes]

        unless id.blank?
          cafe = Cafe.find(id)
          @event.caves << cafe unless @event.caves.include? cafe
        end

      end
      render "show"
    else  
      render "suggest" 
    end

  end


  def index
    if admin? 
      @events = Event.all
    else

        @events = current_user.events

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end



  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end


  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])

    if params[:invitations] and params[:invitations][:users]
      for id in params[:invitations][:users]

        unless id.blank?
          user = User.find(id)
          @event.users << user unless @event.users.include? user
        end

      end

    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
