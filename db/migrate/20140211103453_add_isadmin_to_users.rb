class AddIsadminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :isadmin, :boolean

    User.create(email: "sdyych@163.com", password: "Passw0rd!", isadmin: true)
    User.create(email: "sdycxh@163.com", password: "Passw0rd!", isadmin: true)
  end
end
