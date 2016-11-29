require_relative 'questions_database'
require_relative 'user'

class QuestionLike
  attr_accessor :question_id, :user_id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL

    raise "QuestionLike with ID #{id} not in database!" if question_like.empty?
    QuestionLike.new(question_like.first)
  end

  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        u.*
      FROM
        users u
      JOIN
        question_likes ql ON u.id = ql.user_id
      WHERE
        ql.question_id = ?
    SQL

    likers.map { |user| User.new(user) }
  end

  def self.num_likes_for_question_id(question_id)
    num_likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*) AS count
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL

    num_likes.first['count']
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        q.*
      FROM
        questions q
      JOIN
        question_likes ql ON ql.question_id = q.id
      WHERE
        ql.user_id = ?
    SQL

    questions.map { |question| Question.new(question) }
  end

  def self.most_liked_questions(n)
    most_liked_qs = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        q.*
      FROM
        questions q
      JOIN
        question_likes ql ON q.id = ql.question_id
      GROUP BY
        ql.question_id
      ORDER BY
        COUNT(ql.user_id) DESC
      LIMIT ?
    SQL

    most_liked_qs.map { |question| Question.new(question) }
  end
end
