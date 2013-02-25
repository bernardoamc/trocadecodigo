h = {seal: 5, test: {uncle_seal: 3 }, answer: { nested: "damn", something: { email: "yay!" } } }
h2 = {seal: 5, test: {uncle_seal: 3 }, answer: { nested: "damn" } }

def search_hash(h, search)
  return h[search] if h.fetch(search, false)

  h.keys.each do |k| 
   answer = search_hash(h[k], search) if h[k].is_a? Hash
   return answer if answer
  end 

  false
end

puts search_hash(h, :email)
puts search_hash(h2, :email)
