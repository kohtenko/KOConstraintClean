require "constraintClean/version"
require 'nokogiri'

def cleanupConstraints(file)

	f = File.open(file)
	doc = Nokogiri::XML(f)
	f.close
	
	excluded = []
	variations = doc.xpath('//variation')
	
	included   = doc.xpath('//include')
	outlets    = doc.xpath('//outlet')
	
	variations.each do |variation|
		if variation.attr('key') == "default"
			ch = variation.children
			ch.each do |mask|
				constraints = mask.children
				constraints.each do |constraint|
					if constraint.name == 'exclude'
						excluded.push(constraint)
					end
				end 
			end
		end
	end
	
	result = [] 
	excluded.each do |node| 
		found = false
		for includedNode in included
		p node
			if node.attr('reference') == includedNode.attr('reference')
				found = true
				break
			end
		end
		
		if !found 
			for outlet in outlets
				if node.attr('reference') == outlet.attr('destination')
					found = true
					break
				end	
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
