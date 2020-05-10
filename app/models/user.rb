class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates_length_of :name, minimum: 5, maximum: 30, allow_blank: false

  def member_since
    created_at.strftime("#{created_at.day.ordinalize} %b %Y")
  end

  def last_activity
    last_activity_date =  Post.find_by_sql("
      SELECT max(updated_at) AS updated_at
      FROM posts
      WHERE user_id = #{id}
      ")[0].updated_at
    if last_activity_date
      last_activity_date.strftime("#{last_activity_date.day.ordinalize} %b %Y")
    else
      updated_at.strftime("#{updated_at.day.ordinalize} %b %Y")
    end
  end

end
