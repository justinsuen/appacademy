class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_sub(self) unless boss.nil?
  end

  def bonus(multiplier)
    bonus = salary * multiplier
    bonus
  end
end

class Manager < Employee
  attr_reader :bonus, :sub_employees

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @sub_employees = []
  end

  def add_sub(employee)
    sub_employees << employee
  end

  def bonus(multiplier)
    bonus = 0
    all_sub_employees.each do |sub_em|
      bonus += sub_em.salary
    end
    bonus *= multiplier
    bonus
  end

  def all_sub_employees
    res = []

    queue = sub_employees
    until queue.empty?
      curr_emp = queue.shift
      res << curr_emp
      queue.concat(curr_emp.sub_employees) if curr_emp.is_a?(Manager)
    end

    res
  end
end

# Tests
ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 5000000
p darren.bonus(4) # => 88000
p david.bonus(3) # => 30000
