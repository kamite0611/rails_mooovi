require 'mechanize'

# agent = Mechanize.new
# page = agent.get("http://review-movie.herokuapp.com/")
# elements = page.search(".poster_link img")

# elements.each do |element|
#   puts element.get_attribute('src')
# end

# agent =  Mechanize.new
# page = agent.get("http://review-movie.herokuapp.com/products/342")
# elements = page.search(".post-image")

# elements.each do |element|
#   puts element.get_attribute("src")
# end

links = [] # 個別ページのリンクを保存する配列
agent = Mechanize.new
current_page = agent.get("http://review-movie.herokuapp.com/")
# 個別ページのリンクを取得

elements = current_page.search(".more-link")
elements.each do |element|
  links << element.get_attribute("href")
end

links.each do |link|
  # 個別ページから作品画像のURLを取得
  current_more_page = agent.get("http://review-movie.herokuapp.com/" + link)
  image = current_more_page.search(".post-image")
  puts image.attribute('src')
end
