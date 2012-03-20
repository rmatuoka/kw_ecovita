class ApplicationController < ActionController::Base
  helper :all 
  protect_from_forgery
#  filter_parameter_logging :password 
  helper_method :current_user
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  
  def access_denied
    if current_user
      render :template => 'static_content/denied'
    else
      flash[:notice] = 'Acesso negado. Você precisa estar logado!'
      redirect_to login_path
    end
  end
  
  def load_site_categories
    @category_site = Category.menu
    @banners_laterais = BannerCategory.lateral.banners
    dataandhora = DateTime.now 
    @banners_home = BannerCategory.home.banners.all(:conditions => ['pub_end > ? and pub_start < ?',dataandhora,dataandhora])
  end
  
  def load_cart
    @cart = session[:cart] ||= Cart.new
    #carrega_tagcloud
    @tagcloud = Keyword.tag_counts_on(:tags, :at_least => 200, :limit => 50)
  end
  
  def logado
    if !current_user
      redirect_to root_path
    end
  end
end
