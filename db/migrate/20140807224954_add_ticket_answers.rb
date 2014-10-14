class AddTicketAnswers < ActiveRecord::Migration
  def change
    add_reference :tickets, :answer
  end
end
