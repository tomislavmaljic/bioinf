#initialization
input = ARGV[0]
w = ARGV[1].to_i
k = ARGV[2].to_i

def remove_duplicates(array)
  dup_array = []
  for str in array
    if (dup_array.length == 0 or dup_array[-1] != str)
      dup_array.push(str)
    end
  end
  return dup_array
end

def left_end(str)
  array = []
  (k..l).each do |i|
    array.push(min_substring(str[0..i]))
  end
  return array
end

def right_end(str)
  array = []
  (0..(l-k)).each do |i|
    array.push(min_substring(str[i..l]))
  end
  return array
end

def min_substring (str)
  array = []
  (0..(str.length-k+1)).each do |i|
    array.push(str[i..(i+k)])
  end
  array.sort
  return array[0]
end


#main
start = Time.now
inputFile = File.open(input, "r")
input = inputFile.read.gsub("\n","").gsub("\r","")
inputFile.close

l = w + k - 1
minimazers = []



for str in left_end(inputFile[0..l])
  minimazers.push(str)
end

(0..(input.length-l+1).each do |m|
  minimazers.push(min_substring(input[m..(m+l)]))
end

for str in right_end(inputFile[len(inputFile)-l+1]:)
  minimazers.push(str)
end

minimazers = remove_duplicates(minimazers)

outputFile = File.open("output.txt", "w")
  minimazers.each do |m|
	outputFile.puts m
end
outputFile.close

finish = Time.now

total_time = finish -
puts "Total time elapsed: " + total_time.to_s + " seconds"

total_memory = `ps -o rss -p #{$$}`.strip.split.last.to_i
puts "Total memory usage: " + total_memory.to_s + "KB."
