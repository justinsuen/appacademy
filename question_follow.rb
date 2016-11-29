require_relative 'questions_database'
require_relative 'user'

class QuestionFollow
  attr_accessor :question_id, :user_id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follow
      WHERE
        id = ?
    SQL

    raise "QuestionFollow with ID #{id} not in database!" if question_follow.empty?
    QuestionFollow.new(question_follow.first)
  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        u.*
      FROM
        users u
      JOIN
        question_follows qf ON u.id = qf.user_id
      WHERE
        qf.question_id = ?
    SQL

    followers.map { |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    followed_qs = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        q.*
      FROM
        questions q
      JOIN
        question_follows qf ON q.id = qf.question_id
      WHERE
        qf.user_id = ?
    SQL

    followed_qs.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    most_followed_qs = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        q.*
      FROM
        questions q
      JOIN
        question_follows qf ON q.id = qf.question_id
      GROUP BY
        qf.question_id
      ORDER BY
        COUNT(qf.user_id) DESC
      LIMIT ?
    SQL

    most_followed_qs.map { |question| Question.new(question) }
  end
end
