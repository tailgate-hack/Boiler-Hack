class AddAttributes < ActiveRecord::Migration
  def change

    add_column :earthquakes, :time, :string
    add_column :earthquakes, :latitude, :string
    add_column :earthquakes, :longitude, :string

  end
end
