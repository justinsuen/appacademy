require_relative 'questions_database'

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
end
