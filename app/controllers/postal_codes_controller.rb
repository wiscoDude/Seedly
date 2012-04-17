class PostalCodesController < ApplicationController
  def show
    @postal_code = PostalCode.find_by_postal_code(params[:postal_code])
    @growing_zone = GrowingZoneZipCode.find_by_zip(params[:postal_code])
  end
end
