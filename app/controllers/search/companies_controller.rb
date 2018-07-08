class Search::CompaniesController < ApplicationController
  def index
    @companies = SearchService.new.get_companies(search_params)
  end

  private
    def search_params
      params.permit(:q)
    end
end
