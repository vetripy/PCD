#include <malloc.h>
#include <stdio.h>
typedef struct node node;

struct node {
  int val;
  node *next;
  node *prev;
};

node *Push(node *top) {
  int val;
  node *new = (node *)malloc(sizeof(node));
  printf("Enter value to be inserted :");
  scanf(" %d", &val);
  new->val = val;
  new->next = top;
  printf("%d", new->val);
  top->prev = new;
  top = new;
  printf("%d", top->val);
  return top;
}

node *Pop(node *top) {
  node *curr = top;
  top = curr->next;
  top->prev = NULL;
  free(curr);
  return top;
}

int main(void) {

  int val;
  // start
  printf("Enter start Value :");
  scanf(" %d", &val);
  node *top = NULL;
  node *new = (node *)malloc(sizeof(node));
  new->val = val;
  new->prev = NULL;
  new->next = NULL;
  top = new;
  // decisions
  while (1) {
    int ch;
    printf("Do you want to push/pop/quit?(1/2/3)");
    scanf("%d", &ch);
    switch (ch) {
    case 1:
      top = Push(top);
      printf("%d", top->val);
      break;
    case 2:
      top = Pop(top);
      break;
    case 3:
      break;
    }
    if (ch == 3)
      break;
    printf("Current stack :");
    node *curr = top;
    while (curr != NULL) {
      printf("%d->", curr->val);
      curr = curr->next;
    }
  }
  return 0;
}