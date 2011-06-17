class User < ActiveRecord::Base
  has_many :orders, :dependent => :destroy
  has_many :wishlists, :dependent => :destroy
  
  acts_as_authentic
  acts_as_authorization_subject
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