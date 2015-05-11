class HomepageController < ApplicationController
    def index
      @cafes = Cafe.all.order("CREATED_AT")
      # @locations = Location.all.order("Name")
    end
end
