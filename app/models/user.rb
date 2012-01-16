class User < ActiveRecord::Base
  has_many :orders, :dependent => :destroy
  has_many :wishlists, :dependent => :destroy
  
  acts_as_authentic
  acts_as_authorization_subject
  
  validates_uniqueness_of :email  
  validates_presence_of :nome
  validates_presence_of :phone
  validates_presence_of :address
  validates_presence_of :quarter
  validates_presence_of :cep
  validates_presence_of :sexo
  validates_presence_of :city  

  
  
#  attr_accessible :nome, :sobrenome, :email, :crypted_password, :password_salt, :persistence_token, :sexo, :nascimento, :cpf, :rg
  attr_writer :role
    after_save :define_role
    
    def role
      @role
      if self.has_role? :admin
        @role = :admin
      elsif self.has_role? :supervisor
        @role = :supervisor
      elsif self.has_role? :seller
        @role = :seller
      end
    end
    
    def define_role
      if @role
        self.has_no_roles!
        self.has_role! @role
      end
    end
end