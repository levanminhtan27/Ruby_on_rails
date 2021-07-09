class HomesController < ApplicationController
    before_action :set_user, only: %i[ show ]
    skip_before_action :require_login, only: [:index]

    def index
        @homes=Home.all
    end

end
