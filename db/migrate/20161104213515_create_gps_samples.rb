class CreateGpsSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
    end
    create_table :gps_samples do |t|
      t.float 'latitude', :null => false, :limit => 53
      t.float 'longitude', :null => false, :limit => 53
      t.string 'name'
      t.string 'description'
      t.belongs_to :users, index: true, unique: true, foreign_key: true
    end
  end

  def down
    # Delete table 'gps_samples' and all its content
    drop_table :gps_samples
  end
end
