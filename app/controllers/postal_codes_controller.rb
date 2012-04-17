class PostalCodesController < ApplicationController
  def lookup_zip
    postal_code = params[:postal_code]
    redirect_to show_zip_path(postal_code)
  end
  
  def show
    @postal_code = PostalCode.find_by_postal_code(params[:postal_code])
    @growing_zone = GrowingZone.find_by_zip(params[:postal_code])
  end
end
