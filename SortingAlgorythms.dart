import 'dart:io';

List<int> data=[10,7,4,9,5,78,43,78,2,67,5];
//heap sort is gonna be explaining in binary search trees
//best case O(n)
//avarage case is O(n^2)
//this algorythims analyze is O(n^2) so there it is guaranteed that this can't be bad than that
void InsertionSort(List<int> data,int n){
  int i, j, tmp; 
  print(data);
  for( i = 0 ; i < n ; i++ ){
    for( j = 0 ; j < n ; j++ ){
      if(data[i] < data[j]){
          tmp = data[i];
          data[i] = data[j];
          data[j] = tmp;
      }
    }
  }

  print(data);
}

//worst case O(n^2)

void ShellSort(List<int> data,int n){
  int i, j, tmp, gap;
  print(data);
  for( gap = n ~/ 2 ; gap > 0 ; gap = gap ~/ 2 ){
    for( i = gap ; i < n ; i++ ){
      tmp = data[i];
      for( j = i ; j >= gap && data[j-gap] > tmp ; j -= gap ){
        data[j] = data[j-gap];
      }
      data[j] = tmp;
    }
  }
  print(data);
}


//best case is O(n)
//worst and avarage case is O(n^2)
void BubleSort(List<int> data,int n){
  int i,j;
  print(data);
  for(i=0;i<n-1;i++){
      for(j=0;j<n-i-1;j++){
          if(data[j]>data[j+1]){
            int tmp=data[j];
            data[j]=data[j+1];
            data[j+1]=tmp;
          }
      }
  }
  print(data);

}

void Merge(List<int> data, int left, int middle, int right){
  int i, j, k;
  int n1 = middle - left + 1;
  int n2 = right - middle;

  //temporary lists
  List<int> L=List.filled(n1,0);
  List<int> R=List.filled(n2,0);

  //copy data to temportary lists
  for( i = 0 ; i < n1 ; i++ ){
    L[i] = data[left+i];
  }
  for( j = 0 ; j < n2 ; j++ ){
    R[j] = data[middle+j+1];
  }

  //combine them
  i = 0;
  j = 0;
  k = left;

  while( i < n1 && j < n2 ){
    if( L[i] <= R[j] ){
      data[k] = L[i];
      i++;
    } else {
      data[k] = R[j];
      j++;
    }
    k++;
  }

  while ( i < n1 ){
    data[k] = L[i];
    i++;
    k++;
  }

  while ( j < n2 ){
    data[k] = R[j];
    j++;
    k++;
  }
}

void MergeSort(List<int> data, int left, int right){
  if(left<right){
      int middle = left+(right-left)~/2;

    //merge the array and call the mergesort

    MergeSort(data, left ,middle);
    MergeSort(data, middle+1, right);

    //combine arrays
    Merge(data, left, middle, right);
  }
}



void main(){
  int n=11;//n is the height
  MergeSort(data,0, n-1);
  //BubleSort(data, n);
  //ShellSort(data,n);
  //InsertionSort(data,n);
  print(data);
}