class Course < ApplicationRecord
    has_many :course_enrollments
    has_many :users, through: :course_enrollments
    has_many :sections
    include Filterable
    scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
end
