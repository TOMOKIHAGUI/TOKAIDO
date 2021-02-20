class ChangeBookMarksToBookmarks < ActiveRecord::Migration[5.2]
  def change
    rename_table :book_marks, :bookmarks
  end
end
