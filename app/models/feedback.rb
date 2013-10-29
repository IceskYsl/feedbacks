class Feedback < ActiveRecord::Base
  unloadable
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  
  SCORE = {"优秀（90-100分）" => 1, "满意（75-89分）" => 2, "一般（60-74分）" => 3, "不满意（0-59分）" => 4}
  
  def self.score_collection
      SCORE.collect { |s| [s[0], s[1]]}
  end
  
end
