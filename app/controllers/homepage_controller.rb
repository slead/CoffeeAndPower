class HomepageController < ApplicationController
    def index
      @cafes = Cafe.all.order("CREATED_AT").paginate(:page => params[:page], :per_page => 6)
    end
end
