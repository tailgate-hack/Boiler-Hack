class AddDepthToEarthquakes < ActiveRecord::Migration
  def change
    add_column :earthquakes, :depth, :string
    add_column :earthquakes, :mag, :string
    add_column :earthquakes, :magType, :string
    add_column :earthquakes, :gap, :string
    add_column :earthquakes, :dmin, :string
    add_column :earthquakes, :rms, :string
    add_column :earthquakes, :place, :string
  end
end
