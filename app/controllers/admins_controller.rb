class AdminsController < ApplicationController
  def top
    @requests = Request.where(admin_status: 0)
  end
end
