class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :company, optional: true

  ROLE_ADMIN ="admin"
  ROLE_TRANSPORTER = "transporter"
  ROLE_CLIENT = "client"


  before_save :default_values

  def default_values
    self.role ||= ROLE_ADMIN
  end

  def clients
    if company
      company.clients
    end
  end

  def admin?
    role == ROLE_ADMIN
  end

  def transporter?
    role == ROLE_TRANSPORTER
  end

  def client?
    role == ROLE_CLIENT
  end

end
