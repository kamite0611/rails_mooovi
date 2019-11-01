require 'mechanize'

# agent = Mechanize.new
# puts agent # インスタンスを生成できたか確認
# page = agent.get("https://app-mooovi.herokuapp.com/works/initial_scraping")
# elements = page.search("p")
# puts elements

# elements.each do |element|
#   puts element.inner_text
# end

agent = Mechanize.new
page = agent.get("https://app-mooovi.herokuapp.com/works/third_scraping")
elements = page.search("div div")

elements.each do |element|
  puts element.inner_text
end