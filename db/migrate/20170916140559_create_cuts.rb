class CreateCuts < ActiveRecord::Migration[5.1]
  def change
    create_table :cuts do |t|
      t.text :original, null:false
      t.string :short

      t.timestamps
    end
  end
end
