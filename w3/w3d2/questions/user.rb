require_relative 'questions_database'
require_relative 'question'
require_relative 'reply'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'model_base'

class User < ModelBase
  attr_accessor :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL

    raise "No user named #{fname} #{lname} in database!" if user.empty?
    User.new(user.first)
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    avg_karma = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        CAST(COUNT(ql.user_id) AS FLOAT) / COUNT(DISTINCT q.id) AS avg_val
      FROM
        questions q
      LEFT OUTER JOIN
        question_likes ql ON q.id = ql.question_id
      WHERE
        q.author_id = ?
    SQL

    avg_karma.first['avg_val']
  end
end
