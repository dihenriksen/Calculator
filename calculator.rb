#!/usr/bin/env ruby

require 'set'

def doMath(operator, num1, num2) 
	case operator
	when "+"
		return num1.to_f + num2.to_f
	when "-"
		return num1.to_f - num2.to_f
	when "*"
		return num1.to_f * num2.to_f
	when "/"
		if num2.to_f == 0
			return "NaN"
		else			
			return num1.to_f / num2.to_f	
		end
	when "%"
		if num2.to_f == 0
			return "NaN"
		else			
			return num1.to_f % num2.to_f
		end
	when '**'
		return num1.to_f ** num2.to_f
	end
end

def quitTest (input)
	if input == "q"
		return true
	end
end

def isAValidNumInput(input)
	digits = Set.new ['-','+','.','0','1','2','3','4','5','6','7','8','9']
	input.split("").each do |i|
		if (!digits.include?(i)) 
			return false
		end
	end	
	return true
end

operator = ''
while (true) do
	#get operator
	operator = ''
	num1 = ''
	num2 = ''
	valids = Set.new ['+','-','*','/','%','**']
	until (valids.include?(operator)) do
		puts "Enter operator"
		operator = gets.chomp
		break if quitTest(operator)	
	end

	break if quitTest(operator)	

	
	begin
		puts "Enter first number"
		num1 = gets.chomp
	end while (!isAValidNumInput(num1))
	

	break if quitTest(num1)

	puts "Enter second number"
	num2 = gets.chomp

	break if quitTest(num2)

	result = doMath(operator, num1, num2)
	puts "#{num1.to_s} #{operator} #{num2} = #{result}"
end

