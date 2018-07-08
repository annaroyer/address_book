class CompaniesController < ApplicationController
  def show
    @company = CompanyPresenter.new(company_params)
  end

  private
    def company_params
      CompaniesHouseService.new('/company').get_data(params[:number])
    end
end
