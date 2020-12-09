class AddIntroduceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :integer
  end
end
