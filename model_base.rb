require_relative 'questions_database'
require 'byebug'

class ModelBase
  CLASS_TO_DB = {
    'Question' => 'questions',
    'Reply' => 'replies',
    'User' => 'users',
    'QuestionFollow' => 'question_follows',
    'QuestionLike' => 'question_likes'
  }

  def self.find_by_id(id)
    db = CLASS_TO_DB[self.to_s]
    object = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{db}
      WHERE
        id = ?
    SQL

    raise "#{self} with ID #{id} not in database!" if object.empty?
    self.new(object.first)
  end
end
