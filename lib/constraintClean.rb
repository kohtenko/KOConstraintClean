require "constraintClean/version"
require 'nokogiri'

def cleanupConstraints(file)

	f = File.open(file)
	doc = Nokogiri::XML(f)
	f.close

	excluded = doc.xpath('//exclude')
	included = doc.xpath('//include')
	
	result = [] 
	excluded.each do |node| 
		found = false
		for includedNode in included
			if node.attr('reference') == includedNode.attr('reference')
				found = true
				break
			end
		end
		if !found 
			result.push(node)
			nodeID = node.attr('reference')
			constraints = doc.xpath("//constraint[@id='#{nodeID}']")
			result += constraints
		end
	end
	if result.count > 0 
		f1 = File.open(file, 'w')
		result.each{ |node| node.remove }
		f1.write(doc.to_xml)	
		f1.close
		
		p "removed #{result.count} constraint(s) from #{file}"
	end
end
