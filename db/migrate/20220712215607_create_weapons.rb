class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|

      t.timestamps
    end
  end
end
