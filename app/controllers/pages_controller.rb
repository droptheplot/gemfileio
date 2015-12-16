class PagesController < ActionController::Base
  def index
    render :text => nil, :layout => 'pages'
  end
end
