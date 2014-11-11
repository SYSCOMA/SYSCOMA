class AddAbilityToValues < ActiveRecord::Migration
  def change
    add_reference :values, :ability, index: true
  end
end
