class Search::CompaniesController < ApplicationController
  def index
    @companies = CompaniesHouseService.search_companies(search_params)
  end

  private
    def search_params
      params.permit(:q)
    end
end
