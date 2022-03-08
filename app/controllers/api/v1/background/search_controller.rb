class Api::V1::Background::SearchController < ApplicationController

  def index
    if params['location']
      url = FlickrFacade.get_image_url(params['location'])

      render json: BackgroundSerializer.show(params['location'], url)
    else
      render json: ErrorSerializer.return_errors(["location param is missing"]), status: 404
    end
  end

end
