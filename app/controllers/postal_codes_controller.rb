class PostalCodesController < ApplicationController
  def lookup_zip
    postal_code = params[:postal_code]
    redirect_to show_zip_path(postal_code)
  end
  
  def show
    zip = params[:postal_code]
    @postal_code = PostalCode.find_by_postal_code(zip)
    @growing_zone = GrowingZone.find_by_zip(zip)
    date = params[:date].present? ? Date.strptime(params[:date], '%m/%d') : Time.now.to_date
    @planting_times = PlantingTime.find_all_by_growing_zone_and_date(@growing_zone, date)
  end
end
