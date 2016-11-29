require_relative 'questions_database'

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
end
