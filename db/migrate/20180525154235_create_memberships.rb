class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.boolean :admin, options: {default: false}
      t.references :user, index: true, foreign_key: true
      t.references :channel, index: true, foreign_key: true
      t.timestamps
    end
  end
end
