class Admin::SearchsController < ApplicationController
  access_control do
    allow :admin, :supervisor
  end
  
  layout "admin"
/ Começa
    
  def results
    #Se não for passado keyword manda mensagem de erro!
    if (!params[:keyword].blank?)
      #Grava palavra chave para gerar o tagcloud
      @keyword = Keyword.new
      @keyword.tag_list = params[:keyword]
      @keyword.save
      
      key = "%"+params[:keyword]+"%"

      #Se não for passado a categoria irá carregar todas!
      if !params[:category].blank? 
        cat = " and `categories`.`id` = '"+ params[:category]+"'"
      else
        cat = ' '
      end
      #Se não for passado order irá ordenar pelo campo views
      if !params[:order].blank? 
        case params[:order]
          when '1'
            order = 'views'
          when '2'
            order = 'price'
          when '3'
            order = 'price DESC'
          when '4'
            order = 'name'     
          else
            order = 'views'
        end
      else
        order = 'views'
      end
      #Se não for passado a quantidade de itens por pagina usar 5
      if !params[:pag].blank? 
        qtdade = params[:pag]
      else
        qtdade = '10'
      end      
      @Results = Product.find(:all,
                              :select=> "`products`.*, `subcategories`.`name` as scatname,`categories`.`id` as catid ,`categories`.`name` as catname ",
                              :joins=>"`products` INNER JOIN `subcategories` ON `products`.`subcategory_id` = `subcategories`.`id` INNER JOIN `categories` ON `subcategories`.`category_id` = `categories`.`id` ",
                              :conditions=>["(`products`.`name` like ? or `products`.`summary` like ? or `products`.`description` like ?) AND price > 0 AND published = 1"+cat,key,key,key],
                              :order=> order
                              ).paginate(:page => params[:page], :per_page => qtdade)
    else
      flash[:error] = "Os dados enviados para consulta são invalidos!"
    end
  end  
  
Termina aqui Estava adaptando/  
  
  
  
  
  
#Ainda não esta totalmente OK  
  def index
    if params[:keyword].blank?
      @Orders = Order.all(:include =>[:user], :order => 'id DESC').paginate :page => params[:page],:per_page => 50
    else
       #Se for passado filtro:
       if !params[:filter].blank? 
         case params[:filter]
           when '1' 
             filtro = 'views'
           when '2'
             filtro = 'price'
           when '3'
             filtro = 'price DESC'
           when '4'
             filtro = 'name'     
           else
             filtro = 'views'
         end
       else
         filtro = 'views'
       end
       @Orders = Order.find(:all,
                               :select=> "`products`.*, `subcategories`.`name` as scatname,`categories`.`id` as catid ,`categories`.`name` as catname ",
                               :joins=>"`products` INNER JOIN `subcategories` ON `products`.`subcategory_id` = `subcategories`.`id` INNER JOIN `categories` ON `subcategories`.`category_id` = `categories`.`id` ",
                               :conditions=>["(`products`.`name` like ? or `products`.`summary` like ? or `products`.`description` like ?) AND price > 0 AND published = 1"+cat,key,key,key],
                               :order=> "id DESC"
                               ).paginate(:page => params[:page], :per_page => 50)
      
      
      
    end
  end

  def show
    @Orders = Order.all(:include =>[:user], :order => 'id DESC', :conditions => ['user_id = ?', params[:id]]).paginate :page => params[:page],:per_page => 50
  end
    
  def results
    if !params[:keyword].blank?
      @Results = Order.search_for(params[:keyword])
      
      if !@Results.blank?
        @Results_itens = @Results.first.order_products
      end
    end
  end
  
  def details
    if !params[:keyword].blank?
      @Results = Order.find(params[:keyword])
      
      if !@Results.blank?
        @Results_itens = @Results.order_products
      end
    end
  end
  
  def resend
    if !params[:cod].blank?
      $Order = Order.all(:conditions=>['id = ? and ((status = "completed") or (status = "approved"))',params[:cod]])
      if $Order.count == 0
        flash[:notice] = "Dados informados são invalidos"
      else
        UserMailer.payment_made($Order.first).deliver
        flash[:notice] = "Email Enviado com sucesso!"
      end
    else
      flash[:notice] = "Erro ao processar os dados, ID não informada!"
    end
  end
  
end
