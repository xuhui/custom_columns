class AddCustomColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :cstmcols, :text,  :default => ''
  end
end
