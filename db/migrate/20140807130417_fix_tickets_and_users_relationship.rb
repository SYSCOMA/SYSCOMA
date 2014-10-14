class FixTicketsAndUsersRelationship < ActiveRecord::Migration
  def change
    add_reference :tickets, :author, polymorphic: true
  end
end
