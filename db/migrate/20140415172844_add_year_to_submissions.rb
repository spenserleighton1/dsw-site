class AddYearToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :year, :integer
  end
end
