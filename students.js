function Student(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
}

Student.prototype.name = function() {
  return `${this.firstName} ${this.lastName}`;
};

// Student.prototype.courses = function() {
//   return this.courses;
// };

Student.prototype.enroll = function(course) {
  for (let i = 0; i < this.courses.length; i++) {
    if (this.courses[i].conflictsWith(course)){
      return;
    }
  }

  this.courses.push(course);

  if (!course.students.includes(this)) {
    course.addStudent(this);
  }
};

Student.prototype.courseLoad = function() {
  let res = Object();
  this.courses.forEach((course) => {
    if (res[course.department]) {
      res[course.department] += course.credits;
    } else {
      res[course.department] = course.credits;
    }
  });
  return res;
};

function Course(courseName, department, credits, days, timeBlock) {
  this.courseName = courseName;
  this.department = department;
  this.credits = credits;
  this.days = days;
  this.timeBlock = timeBlock;
  this.students = [];
}

Course.prototype.students = function() {
  return this.students;
};

Course.prototype.addStudent = function(student) {
  this.students.push(student.name());
};

Course.prototype.conflictsWith = function(otherCourse) {
  for (let i = 0; i < this.days.length; i++) {
    if (otherCourse.days.includes(this.days[i]) &&
        this.timeBlock === otherCourse.timeBlock){
      return true;
    }
  }
  return false;
};

const s1 = new Student("Mike", "Marks");
const c1 = new Course("Math 100", "Math", 4, ['mon', 'tues', 'wed'], 1);
const c2 = new Course("Math 101", "Math", 5, ['mon'], 1);
const c3 = new Course("Math 102", "Math", 5, ['thu'], 1);

// console.log(c1.conflictsWith(c2));
// console.log(c2.conflictsWith(c1));
// console.log(c2.conflictsWith(c3));

s1.enroll(c1);
s1.enroll(c2);
s1.enroll(c3);

console.log(s1.courses);
console.log(s1.courseLoad());
console.log(c1.students);
