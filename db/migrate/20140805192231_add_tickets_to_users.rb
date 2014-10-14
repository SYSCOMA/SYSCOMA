class AddTicketsToUsers < ActiveRecord::Migration
  def change
    
    # this line adds an integer column called `ticket_id`.
    add_reference :tickets, :user, index: true
  end
end
