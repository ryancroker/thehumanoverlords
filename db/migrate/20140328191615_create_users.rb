class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "user_name", :limit => 25
      t.string "password", :limit => 50
      t.timestamps
    end
  end

  def down
  	drop_table :users
  end

end
