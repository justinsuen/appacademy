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

  def save
    db = CLASS_TO_DB[self.class.to_s]
    inst_var = self.instance_variables
    inst_var.delete(:@id)

    values_hash = Hash.new
    inst_var.each do |var|
      accessor = var.to_s[1..-1]
      values_hash[var] = self.send(accessor)
    end

    if @id.nil?
      q_str = (['?'] * inst_var.count).join(', ')
      set_str = inst_var.join(', ')
      set_str.tr!('@', '')

      QuestionsDatabase.instance.execute(<<-SQL, *values_hash.values)
        INSERT INTO
          #{db} (#{set_str})
        VALUES
          (#{q_str})
      SQL

      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      set_str = "#{inst_var.join(' = ?, ')} = ?"
      set_str.tr!('@', '')

      QuestionsDatabase.instance.execute(<<-SQL, *values_hash.values, @id)
        UPDATE
          #{db}
        SET
          #{set_str}
        WHERE
          id = ?
      SQL
    end
  end
end
