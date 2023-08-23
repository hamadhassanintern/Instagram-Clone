# frozen_string_literal: true

class AddPrivatetoPost < ActiveRecord::Migration[7.0]
  def change
    # Add the private attribute in the posts table 
    add_column :posts, :private, :boolean
  end
end
