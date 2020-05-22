#include <bits/stdc++.h>
using namespace std;

typedef long long      ll;
typedef vector<int>    vi;
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

// naming rules
// array starts with "ar". for example ar_a
// stack starts with "st". for example st_a
// queue starts with "qu". for example qu_a
// vector starts with "vc". for example vc_a

int charToInt(char c) {
  string tmp;
  tmp += c;
  int b = atoi(tmp.c_str());
  return b;
}

int stringToInt(string s) {
  return atoi(s.c_str());
}

// deletes vec_t[from_index] through vec_t[to_index]
// for example if from_index is 1 and to_index is 3, deletes vec_t[1], vec_t[2]
// void delIndexBetween(vi vec_t, int from_index, int to_index) {
//   vec_t.erase(vec_t.begin() + from_index, vec_t.begin() + to_index);
// }

// deletes vec_t[index]
// void delIndex(vi vec_t, int index) {
//   vec_t.erase(vec_t.begin() + index);
// }

// deletes first num, which was given as first arg, found in vec_a
// void del(vi vec_t, int num) {
//   int id = -1;
//   rep(i, vec_a.size()) {
//     if (num == vec_a[i]) {
//       id = i;
//       break;
//     }
//   }
//   if (id != -1) delIndex(id);
// }

int main() {
  // expects input to be like
  /*
     n
     a1 a2 a3 a4 a5 a6..., an
  */

  int n;
  int c = 0;
  vi  vc_a;
  cin >> n;

  // comment out below when input is given in the format n k
  /* n k */

  // int k;
  // cin >> k;

  // receiving input
  while (c < n) {
    int tmp;
    cin >> tmp;
    vc_a.pb(tmp);
    c++;
  }

  rep(i, n) {
    cout << vc_a[i] << endl;
  }

  // for result output like below
  /*
     p1 500
     p2 1000
     p3 1000
  */

  // rep(i, n) {
  //   cout << vi_a[i].name << " " << vi_a[i].ms << endl;
  // }

  return 0;
}
