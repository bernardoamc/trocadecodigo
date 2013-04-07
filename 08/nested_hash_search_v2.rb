h = { seal: 5, 
      email: "easy",
      test: { uncle_seal: 3, email: 'first!', foca: { email: 'opa' } }, 
      answer: { nested: "damn", something: { email: "yay!" } } }

h2 = { seal: 5, 
       test: {uncle_seal: 3 }, 
       answer: { nested: "damn", email: "hoho" } }

def search_hash(h, search, results)
  results << h[search] if h.fetch(search, false)

  h.keys.each do |k| 
   search_hash(h[k], search, results) if h[k].is_a? Hash
  end 

  results
end

puts search_hash(h, :email, []).inspect
puts search_hash(h2, :email, []).inspect
