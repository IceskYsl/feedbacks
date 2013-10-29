class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id #针对用户
      t.integer :leader_id #leader
      t.integer :author_id #leader
      
      t.string :day
      t.integer :week
      
      t.integer :score #score
      t.string  :tags
      t.text :good
      t.text :nogood
      t.integer :status, :default => 0 #
      t.timestamp :created_at
    end
    
    add_index :feedbacks, :user_id
    
    def self.down
      drop_table :feedbacks
    end
    
  end
end
