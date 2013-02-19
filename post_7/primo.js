function primo(v) {
  if(!primo.cache) { primo.cache = {1: false} }
 
  if(primo.cache[v] != null) {
    return primo.cache[v];
  }
 
  if(v % 2 == 0) {
    return primo.cache[v] = false;   
  }
 
  var resposta = true,
      limite = Math.sqrt(v);
 
  for(var i = 3; i < limite; i += 2) {
    if (v % i == 0) {
      resposta = false;
      break;
    }
  }
 
  return primo.cache[v] = resposta;
}

console.log(primo(17));
console.log(primo(25));
console.log(primo(31));
console.log(primo(53));
