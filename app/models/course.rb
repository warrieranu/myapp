class Course < ApplicationRecord
    has_many :course_enrollments
    has_many :users, through: :course_enrollments
    has_many :sections
    scope :search, lambda {|query| where (["lower(name) like ?", "%#{query.downcase}%"])
    }
    scope :search_one, lambda {|query| where (["lower(description) like ?", "%#{query.downcase}%"])
    }
end
