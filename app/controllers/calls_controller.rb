class CallsController < InheritedResources::Base
  def create
    create! do |success, failure|
      success.html { session[:call_id] = @call.id; redirect_to root_url(anchor: "share") }
    end
  end
end
