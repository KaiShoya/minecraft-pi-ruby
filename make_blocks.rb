require 'open-uri'
require 'nokogiri'

def get_html(url, charset = nil)
	html = open(url) do |f|
		charset = f.charset if charset == nil
		f.read
	end
	return Nokogiri::HTML.parse(html, nil, charset)
end

url = 'http://minecraft-ids.grahamedgecombe.com/'
doc = get_html(url)
blocks_id = {}
blocks_name = {}
doc.xpath('//*[@id="rows"]/tr').each do |node|
	id = node.css("td")[0].text.split(":")
	text_id = node.css("td")[2].css(".text-id").text.delete("(").delete(")").split(":")[1].upcase
	blocks_id[text_id] = id[0]

	# name = node.css("td")[2].css(".name").text.gsub(/[\s-]/, "_").delete("(").delete(")").delete("'").gsub(/13/, "thirteen").gsub(/11/, "eleven").upcase
	# blocks_name[name] = id
end

File.open("#{File.dirname(__FILE__)}/lib/blocks.rb", "w") do |f|
	f.puts("module Block")
	blocks_id.each do |k, v|
		f.puts("  #{k} = #{v}")
	end
	f.puts("end")

	# f.puts("module Block")
	# blocks_name.each do |k, v|
	# 	f.puts("  #{k} = #{v}")
	# end
	# f.puts("end")
end
