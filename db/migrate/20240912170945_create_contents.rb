class CreateContents < ActiveRecord::Migration[7.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :body
      t.string :home_page_url
      t.string :img_url
      t.uuid :user_id, null: false

      t.timestamps
    end

    add_foreign_key :contents, :users, column: :user_id
  end
end
