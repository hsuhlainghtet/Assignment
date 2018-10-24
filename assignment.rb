require 'spreadsheet'
example = Spreadsheet::Workbook.new
sheet1=example.create_worksheet :name => "Assignment"
j=0
begin

loop do
puts "Enter the first number"
fnum=gets.chomp.to_i
puts "Enter the second number"
snum=gets.chomp.to_i
puts "Enter the operation"
op=gets.chomp
if op=="+"
ans= fnum+snum


elsif op=="-"
ans= fnum-snum

elsif op=="*"
ans= fnum*snum

else op=="/"
ans= fnum/snum
end
time=Time.new
sheet1.row(j).push fnum, op, snum, '=', ans, time.inspect
format= Spreadsheet::Format.new :horizontal_align => :centre
sheet1.row(j).default_format = format
sheet1.column(5).width = 30
j=j+1


puts "Do you want to more operation(y/n)?"
n=gets.chomp
if n=="n"

break
end
rescue Exception => e
puts e.message + "is Error."
end 
end
example.write Dir.pwd+'\Assignment2.xls'
