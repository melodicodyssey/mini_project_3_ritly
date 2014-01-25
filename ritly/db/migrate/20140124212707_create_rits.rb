class CreateRits < ActiveRecord::Migration
  def change
    create_table :rits do |t|
      t.string :entered_url
      t.string :short_url
      t.string :custom_url
      t.integer :visited

      t.timestamps
    end
  end
end
