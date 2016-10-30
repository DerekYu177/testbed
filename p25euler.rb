def longer?(a, max_length)
  (a.max).to_s.length > max_length-1
end

def fibonnaci(n)
  arr = [0,1]
  head = true
  index = 1
  while !longer?(arr, n) do
    head ? arr[0] = arr[0] + arr[1] : arr[1] = arr[0] + arr[1]
    head ? head = false : head = true
    index = index + 1
    p "n:#{arr.max}, l:#{arr.max.to_s.length}"
  end
  p index
end

fibonnaci(1000)
