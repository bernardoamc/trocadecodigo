var positions = [[27.5, 17.9], [13.1, 16.3], [4.3, 28.4]];

//Antes - Before
var arr = [];
for(var i = 0, size = positions.length; i < size; i++) {
  arr.push(positions[i][0], positions[i][1]);
}

//Depois - After
arr = [].concat.apply([], positions);
