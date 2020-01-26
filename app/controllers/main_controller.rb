class MainController < ApplicationController
    def index
        @projects = Project.order(:order)
    end
end