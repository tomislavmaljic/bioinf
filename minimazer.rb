#initialization
input = ARGV[0]
w = int(ARGV[1])
k = int(ARGV[2])

def remove_duplicates(array)
  dup_array = []
  for str in array
    if (dup_array.length == 0 or dup_array[-1] != str)
      dup_array.push(str)
    end
  end
  return dup_array
end


#main
start = Time.now
inputFile = File.read(input).gsub("\n","").gsub("\r","")

for str in left_end(inputFile[0:l])
  minimazers.push(str)
end

for i in range (0, inputFile.length-l+1)
  minimazers.push(str)
end

for str in right_end(inputFile[len(inputFile)-l+1]:)
  minimazers.push(str)
end

minimazers = remove_duplicates(minimazers)
