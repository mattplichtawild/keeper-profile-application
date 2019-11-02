class AddForeignKeyToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :zookeeper_id, :foreign_key
  end
end
#didn't include foreign key when creating animals table