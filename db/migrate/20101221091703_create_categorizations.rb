class CreateCategorizations < ActiveRecord::Migration

  def self.up
    create_table :categorizations do |t|
      t.string :name
      t.string :code
      t.integer :position
    end

    create_table :categories do |t|
      t.string :name
      t.string :code
      t.integer :categorization_id
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :position
      t.text :description
    end

    create_table :record_categories do |t|
      t.integer :record_id
      t.string :record_type
      t.integer :category_id
    end

    #add_index :categorizations, :id

    load(Rails.root.join('db', 'seeds', 'categorizations.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "categorizations"})

    Page.delete_all({:link_url => "/categorizations"})

    drop_table :categorizations
    drop_table :categories
  end

end
