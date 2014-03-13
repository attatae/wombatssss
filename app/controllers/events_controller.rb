class EventsController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
	#added destroy to above, not in Treebook

	def index
		@events = Event.all 
	end
	
	def new # diff between new and create?
		@event = Event.new
	end

	def create #save our new event to a database
		@event = Event.new(params[:event].permit(:title, :text, :event_start))
		#@event = current_user.events.new(params[:events])

		#respond_to do|format|

		if @event.save
			redirect_to @event 
		else
			render 'new'
			#The render method is used so that the @post 
			#object is passed back to the new template when it is rendered. 
			#This rendering is done within the same request as the form 
			#submission, whereas the redirect_to will tell the browser to issue another request.
		end
	end
	#end #for respond_to; noticed in "What is a join table"

	def show #show, being an action
		@event = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		#first line begins below =================
		#@event = current_user.events.find(params[:id])
		#if params[:event && params[:status].has_key?(:user_id)
		#params[:event].delete(:user_id)
		#end
		#respond_to do |format|

		if @event.update(event_params)
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
		@event = Event.find(params[:id])

		@event.destroy

		redirect_to events_path
	end

#def status_params
#    params.require(:status).permit(:name, :content, :user_id)
#    end
    
	private
		def event_params
			params.require(:event).permit(:title, :text, :user_id, :event_start)
		end
end

