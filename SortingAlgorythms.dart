List<int> data=[10,7,4,9,5];
//best case O(n)
//avarage case is O(n^2)
//this algorythims analyze is O(n^2) so there it is guaranteed that this can't be bad than that
void InsertionSort(List<int> data,n){
  int i,j,tmp; 
  print(data);
  for(i=0;i<=n;i++){
    for(j=0;j<=n;j++){
      if(data[i]<data[j]){
          tmp=data[i];
          data[i]=data[j];
          data[j]=tmp;
      }
    }
  }

  print(data);
}

void 

void main(){
  int n=4;//n is the height
  InsertionSort(data,n);
  print(data);
}