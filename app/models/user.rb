class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :tickets, as: :author
  belongs_to :job
  has_many :user_competencies, class_name: "UserCompetencies"
  has_many :competencies, class_name: "CompetenciesMatrix", through: :user_competencies
  has_many :supervised_teams, class_name: "Team"
end
