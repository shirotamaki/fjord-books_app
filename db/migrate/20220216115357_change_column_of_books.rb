class ChangeColumnOfBooks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :books, :title, false, ""
    change_column_null :books, :memo, false, ""
  end
end
