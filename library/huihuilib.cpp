#include <bits/stdc++.h>
using namespace std;

typedef long long ll;
typedef vector<int> vi;
typedef vector<string> vs;

#define FOR(i, a, b) for (int i = (a); i < (b); i++)
#define rep(i, n)    FOR(i, 0, n)
#define pb           push_back
#define all(a)       (a).begin(), (a).end()
#define UNIQUE(v)    v.erase(unique(all(v)), v.end());
#define fill(a, x)   memset(a, x, sizeof(a))
#define zero(a)      fill(a, 0)
#define minus(a)     fill(a, -1)
#define dbg(x)       cout << #x "=" << x << endl

//#################################################
// naming rules
// bugをなるべく生み出さないために以下に従うこと
// queue starts with "Q". for example QUA
// array starts with "A". for example ARA
// stack starts with "S". for example STA
// vector starts with "V". for example VCA
// global variable starts with "gl". for example glA
// counter variable starts with "cnt". for example cntC

//#################################################
// string related
int charToInt(char c) {
  string tmp;
  tmp += c;
  int b = atoi(tmp.c_str());
  return b;
}

int stringToInt(string s) {
  return atoi(s.c_str());
}
//#################################################
// vector related
// deletes VT[from_index] through VT[to_index]
// for example if from_index is 1 and to_index is 3, deletes VT[1] and VT[2]

void delIndexBetween(vi VT, int fromIndex, int toIndex) {
  VT.erase(VT.begin() + fromIndex, VT.begin() + toIndex);
}

void delIndex(vi VT, int index) {
  VT.erase(VT.begin() + index);
}

void del(vi VT, int num) {
  int id = -1;
  rep(i, VT.size()) {
    if (num == VT[i]) {
      id = i;
      break;
    }
  }
  if (id != -1) {
    delIndex(VT, id);
  }
}
//#################################################
// input
// comment out below when input is given in the format n k
/* n k */
// int k;
// cin >> n >> k
//#################################################
// output
// for result output like below
/*
   p1 500
   p2 1000
   p3 1000
*/

// rep(i, n) {
//   cout << C[i].name << " " << C[i].ms << endl;
// }
