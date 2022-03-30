class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role

  def full_name
    return  "#{self.first_name} #{self.last_name}"
  end

  def to_string
    string = ""
    User.all.each do |user|
      string += "first_name: #{user.first_name}, last_name: #{user.last_name}"
    end
    string
  end

    def is_admin
      self.role.name == "ADMIN" ? true : false
    end


    def is_trainer
      self.role.name == "TRAINER" ? true : false
    end

    def is_student
      self.role.name == "STUDENT" ? true : false
    end

end
