class SearchController < ApplicationController
  def index
    
  end
  
  def results
    #Se não for passado keyword manda mensagem de erro!
    if (!params[:keyword].blank?)
      key = "%"+params[:keyword]+"%"

      #Se não for passado a categoria irá carregar todas!
      if !params[:category].blank? 
        cat = " and `categories`.`id` = '"+ params[:category]+"'"
      else
        cat = ' '
      end
      #Se não for passado order irá ordenar pelo campo views
      if !params[:order].blank? 
        order = params[:order]
      else
        order = 'views'
      end
      #Se não for passado a quantidade de itens por pagina usar 5
      if !params[:pag].blank? 
        qtdade = params[:pag]
      else
        qtdade = '5'
      end      
      @Results = Product.find(:all,
                              :select=> "`products`.*, `subcategories`.`name` as scatname,`categories`.`id` as catid ,`categories`.`name` as catname ",
                              :joins=>"`products` INNER JOIN `subcategories` ON `products`.`subcategory_id` = `subcategories`.`id` INNER JOIN `categories` ON `subcategories`.`category_id` = `categories`.`id` ",
                              :conditions=>["(`products`.`name` like ? or `products`.`summary` like ? or `products`.`description` like ?)"+cat,key,key,key],
                              :order=> order
                              ).paginate :per_page => qtdade
    else
      flash[:error] = "Os dados enviados para consulta são invalidos!"
    end
  end
end
