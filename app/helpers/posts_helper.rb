module PostsHelper
 
  def events(start_date, end_date)
    Post.where("event_time BETWEEN ? AND ? AND event= ?", start_date, end_date, true)
  end

end
