class SearchController < ApplicationController
  layout "interna"
  before_filter :load_site_categories,:load_cart  
  def index
    
  end
  
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
end
