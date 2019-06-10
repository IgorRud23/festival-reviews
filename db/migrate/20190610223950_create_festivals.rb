class CreateFestivals < ActiveRecord::Migration
  def change

    create_table :festivals do |t|
      t.string :festival_name
      t.integer :user_id
      t.timestamps

  end
end
end
