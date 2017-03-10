class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string     :name
      t.string     :author_name
      t.text       :description
      t.integer    :status, default: 0
      t.belongs_to :user
      t.timestamps
    end
  end
end
