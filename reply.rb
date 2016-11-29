require_relative 'questions_database'

class Reply
  attr_accessor :question_id, :reply_parent_id, :user_id, :body

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @reply_parent_id = options['reply_parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    raise "Reply with ID #{id} not in database!" if reply.empty?
    Reply.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    raise "User ID #{user_id} has no replies!" if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    raise "Question ID #{question_id} has no replies!" if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@reply_parent_id)
  end

  def child_replies
    children = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        reply_parent_id = ?
    SQL

    raise "Reply with id #{@id} has no children!" if children.empty?
    children.map { |child| Reply.new(child) }
  end

  def save
    if @id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, @question_id, @reply_parent_id, @user_id, @body)
        INSERT INTO
          replies (question_id, reply_parent_id, user_id, body)
        VALUES
          (?, ?, ?, ?)
      SQL

      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, @question_id, @reply_parent_id, @user_id, @body, @id)
        UPDATE
          replies
        SET
          question_id = ?, reply_parent_id = ?, user_id = ?, body = ?
        WHERE
          id = ?
      SQL
    end
  end
end
