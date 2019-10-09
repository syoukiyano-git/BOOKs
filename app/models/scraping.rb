require 'mechanize'

class Scraping
    def self.book_urls
      links = []
      agent = Mechanize.new
      next_url = ""
      
      while true
      current_page = agent.get("https://honto.jp/ranking/gr/bestseller_1101_1201_011_029007000000.html" + next_url)
      elements = current_page.search('h2 a')
        elements.each do |ele|
            links << ele.get_attribute('href')
        end 
        next_link = current_page.at('.stNext a')
        break unless next_link
        next_url = next_link.get_attribute('href')
        
      end
        links.each do |link|
            get_product(link)
        end
    end
    
    def self.get_product(link)
        agent = Mechanize.new
        page = agent.get(link)
        title = page.at('.stOverview .stTitle').inner_text if page.at('.stOverview .stTitle')
        image_url = page.at('.stPhoto img')[:src] if page.at('.stPhoto img')
        author = page.at('.stAuthor a').inner_text if page.at('.stAuthor a')
        detail = page.at('.stContents p').inner_text if page.at('.stContents p')
        release_date = page.at('.stExtra ul li').inner_text if page.at('.stExtra ul li')
        
        product = Product.where(title: title).first_or_initialize
        product.image_url = image_url
        product.author = author
        product.detail = detail
        product.release_date = release_date
        product.save
    end 
end