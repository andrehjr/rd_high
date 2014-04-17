require 'rd_highrise_api'

class PeopleController < ApplicationController

  def create
    people = RdHighriseApi::People.new(params[:url], params[:api_key])

    response = people.create(person_params)
    if response[:status] == 201
      @people = people.all
      redirect_to root_path, notice: I18n.t('created_with_success')
    else
      @errors = response[:messages]
      render :new
    end
  rescue => e
    flash[:error] = I18n.t('invalid_credentials')
    render :new
  end

  def person_params
    params.require(:person).permit(:url, :first_name, :last_name,
                                   :title, :background, :"linkedin-url",
                                   :phone_number, :email_address,
                                   :company_name, :web_address)
  end
end