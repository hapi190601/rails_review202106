class CreateChapter3s < ActiveRecord::Migration[5.2]
  def change
    create_table :chapter3s do |t|

      t.timestamps
    end
  end
end
