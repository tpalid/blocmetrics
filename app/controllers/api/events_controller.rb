class API::EventsController < ApplicationController
    
    before_filter :set_access_control_headers
    skip_before_action :verify_authenticity_token
    
    def set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
        headers['Access-Control-Allow-Headers'] = 'Content-Type'
    end
    

    
    def create
       
        registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
        @event = Event.new(event_params)
        @event.registered_application = registered_application
        if registered_application == nil
            render json: "Unregistered application", status: :unprocessable_entity #more user friendly error
        elsif @event.save
            render json: @event, status: :created
        else
            binding.pry
            render @event.errors, status: :unprocessable_entity
        end
    end
    

    private
    
    def event_params
        # params.permit(:name)
        params.require(:event).permit(:name)
    end
end