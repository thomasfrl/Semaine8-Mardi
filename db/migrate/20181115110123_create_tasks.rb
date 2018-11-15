class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|

      t.timestamps
      t.string :title
      t.boolean :status
      t.datetime :deadline
    end
  end
end
