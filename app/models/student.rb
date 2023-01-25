class Student < ApplicationRecord
  after_create :enroll_in_semester
  after_update :enroll_in_semester
  attr_accessor :enroll_year, :semester_type, :semester_no
  
  has_many :student_semesters
  has_many :semesters, through: :student_semesters
  has_many :enrollments
  has_one_attached :image, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Constants
  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/x.freeze

  # Validations
  validates :password,
            presence: true,
            format: { with: PASSWORD_FORMAT },
            confirmation: true,
            format: { with: PASSWORD_FORMAT }
  validates :first_name, :last_name, :Date_of_Birth, :roll_no, presence: true

  private

  def enroll_in_semester
    semester_id = Semester.where(semester_type: self.semester_type, semester_no: self.semester_no).ids[0]
    if self.semesters[-1].id == semester_id
      return
    else
    self.student_semesters.create(semester_id: semester_id, enroll_year: self.enroll_year)
    end
  end
end 
