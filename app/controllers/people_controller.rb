class PeopleController < ApplicationController

  def create
    raise 'not yet'
  end

  def person_params
    params.require(:person).permit(:url, :first_name, :last_name, :title, :background, :"linkedin-url")
  end
end