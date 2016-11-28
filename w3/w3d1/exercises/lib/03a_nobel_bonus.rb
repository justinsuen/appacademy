# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT
    DISTINCT n1.yr
  FROM
    nobels n1
  WHERE
    'Physics' IN (
      SELECT
        subject
      FROM
        nobels n2
      WHERE
        n2.yr = n1.yr
    ) AND 'Chemistry' NOT IN (
      SELECT
        subject
      FROM
        nobels n2
      WHERE
        n2.yr = n1.yr
    )
  SQL
end
