class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :corp_name
      t.string :corp_address
      t.string :corp_desk
      t.string :corp_fax
      t.string :corp_website
      t.string :contact_name
      t.string :contact_mobile
      t.string :contact_ID
      t.string :contact_email
      t.string :summary

      t.timestamps
    end
  end
end
