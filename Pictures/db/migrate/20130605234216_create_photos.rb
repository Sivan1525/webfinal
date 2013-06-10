class CreatePhotos < ActiveRecord::Migration
  def change
  	# drop_table :photos
    create_table :photos do |t|
      t.string :detail
      t.integer :user_id
      t.string :image
      t.timestamps
    end
  end
end