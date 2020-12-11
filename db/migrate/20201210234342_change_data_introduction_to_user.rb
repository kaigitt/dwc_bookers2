class ChangeDataIntroductionToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :introduction, :string
  end
end
