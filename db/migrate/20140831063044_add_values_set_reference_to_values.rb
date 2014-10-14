class AddValuesSetReferenceToValues < ActiveRecord::Migration
  def change
    add_reference :values, :values_set
  end
end
