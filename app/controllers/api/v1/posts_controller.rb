class Api::V1::TopicsController < Api::V1::BaseController

  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def create
  end

  def update
  end

  def destroy
  end
end
