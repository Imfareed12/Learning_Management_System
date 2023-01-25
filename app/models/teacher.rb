class Teacher < ApplicationRecord

  has_many :sections
  has_and_belongs_to_many :courses, join_table: "expertises"
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
  validates :first_name, :last_name, :Date_of_Birth, presence: true

end
