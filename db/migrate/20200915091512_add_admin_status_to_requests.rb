class AddAdminStatusToRequests < ActiveRecord::Migration[5.2]
  def change
  	add_column :requests, :admin_status, :integer, default: 0
  end
end
