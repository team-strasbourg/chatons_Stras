class CreateJoinTableOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_order_items do |t|

      t.timestamps
    end
  end
end
