class Search::CompaniesController < ApplicationController
  def index
    @companies = Company.search_all(search_params)
  end

  private
    def search_params
      params.permit(:q)
    end
end
