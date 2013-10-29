module FeedbacksHelper
  
  def can_edit?(feedback)
    if (feedback.day == Date.today.to_s) && (feedback.user_id == session[:user_id])
      return true
    end
      return false
  end
  
  def score_title(score)
    # Feedback::SCORE.has_value? score
    Feedback::SCORE.key(score)
  end
  
end
