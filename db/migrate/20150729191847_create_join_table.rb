class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :books, :tags do |t|
    end
  end
end
