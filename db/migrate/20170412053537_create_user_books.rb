class CreateUserBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_books do |t|

      t.timestamps
    end
  end
end
