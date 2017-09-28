# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students


  def self.search(search_term)
    @students = Student.all
    if search_term.empty?
      @students
    else
      @students.select { |student| student.name.match(search_term.capitalize)}
    end
  end

end
