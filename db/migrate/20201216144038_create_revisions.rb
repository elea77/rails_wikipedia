class CreateRevisions < ActiveRecord::Migration[6.0]
  def change
    create_table :revisions do |t|
      t.string :content
      t.string :title
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
