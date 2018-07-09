class CompaniesController < ApplicationController
  before_action :set_company

  def show
  end

  def create
    if @company.save
      flash.now[:notice] = "Company Record added to Address Book"
    else
      flash.now[:notice] = "Import Was Unsuccessful"
    end
    render :show
  end

  private

    def set_company
      @company = Company.from_service(companies_house_data)
    end

    def companies_house_data
      CompaniesHouseService.new('/company').get_data(params[:number])
    end
end
