class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #checks if a name is supplied before proceeding to these methods.
  validates_presence_of :name
  def first_name
    #self = specfic user. split = takes a string and splits it into array.
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

end
