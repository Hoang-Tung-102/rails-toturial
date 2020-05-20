class CreateTungits < ActiveRecord::Migration[6.0]
  def change
    create_table :tungits do |t|

      t.timestamps
    end
  end
end
