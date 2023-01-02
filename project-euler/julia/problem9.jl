function find_triple()
  for a = 0:1000
    for b = (1000-a):-1:0
      c = 1000 - a - b

      if (a^2 + b^2) == c^2
        println((a,b,c))
      end
    end
  end
end

find_triple()
