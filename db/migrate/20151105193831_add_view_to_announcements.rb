class AddViewToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :view, :integer
  end
end
