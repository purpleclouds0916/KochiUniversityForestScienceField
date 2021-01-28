module ApplicationHelper
    
  # ページごとの完全なタイトルを返す                  
  def full_title(page_title = '')                     
    base_title = "高知大学 森林科学領域 公式ホームページ"  
    if page_title.empty?                              
      base_title                                      
    else
      page_title + " | " + base_title                 
    end
  end

  # def full_url(path)
  #   domain = if Rails.env.development?
  #              'http://localhost:3000'
  #            else
  #              'https://ltqphygm.herokuapp.com'
  #            end
  #   "#{domain}#{path}"
  # end
end