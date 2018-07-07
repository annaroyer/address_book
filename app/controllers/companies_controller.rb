class CompaniesController < ApplicationController
  def show
    @company = Company.get_by_number(params[:number])
  end
end
