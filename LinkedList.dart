import 'dart:io';

class Node{
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList{
  Node? head;

  //basa dugum ekleme
  void addFirst(int data){
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  //sona dugum ekleme
  void addLast(int data){
    Node newNode = Node(data);
    if(head == null){
      head=newNode;
    } else {
      Node current = head!;
      while(current.next != null){
        current = current.next!;
      }
      current.next = newNode;
    }
  }


  //belirli bir degeri arayip silme
  void delete(int data){
    if(head == null) return;

    //eğer silinecek dugum bastaysa
    if(head!.data == data){
      head = head!.next;
      return;
    }

    Node current = head!;
    while(current.next != null){
      if(current.next!.data == data){
        current.next = current.next!.next;
        return;
      }
      current = current.next!;
    }
  }
  //listeyi yazdırma
  void printList(){
    Node? current = head;
    while (current != null){
      print(current.data);
      current = current.next;
    }
  }
}

void main(){
  LinkedList list = LinkedList();

  list.addFirst(10);
  list.addFirst(20);
  list.addLast(30);
  list.addLast(40);

  print("Linked List: ");
  list.printList();

  list.delete(20);
  print("After deletin 20: ");
  list.printList();
}