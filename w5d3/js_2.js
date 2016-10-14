function titleize(arr, callback) {
  for (var i = 0; i < arr.length; i++){
    callback(arr[i]);
  }
}

function printer(string){
  console.log(string);
}

titleize(["mickey", "jesus"], printer);
