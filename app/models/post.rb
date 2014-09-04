class Post < ActiveRecord::Base
validates :url, presence: true
validates :url, :format => URI::regexp(%w(http https))
has_many :comments

  def one_point
    value_plus_one = self.points + 1
    self.update(:points => value_plus_one)
  end

  def initial_points
    self.update(:points => 5)
  end

  def points_to_votes
    time = Time.now
    hour = time.hour
    count = self.points
      time_created = hour.to_i - self.created_at.strftime("%H").to_i
      total = count + time_created
      self.update(:points => total.abs)
  end

end
