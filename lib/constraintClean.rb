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
			if node.attr('reference') == includedNode.attr('reference')
			puts "constarint with id = '#{node.attr('reference')}' of '#{file}' is included to sizeClasses variation and can't be removed".colorize(:yellow)
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
		content = doc.to_xml.each_line.reject{|x| x.strip == ""}.join
		f1.write(content)	
		f1.close
		
		puts "removed #{result.count} constraint(s) from #{file}".colorize(:green)
	end
end
