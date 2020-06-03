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

// naming rules
// array starts with "ar". for example arA
// stack starts with "st". for example stA
// queue starts with "qu". for example quA
// vector starts with capital letter. for example A

/* string related
int charToInt(char c) {
  string tmp;
  tmp += c;
  int b = atoi(tmp.c_str());
  return b;
}
int stringToInt(string s) {
  return atoi(s.c_str());
}
*/

/* vector related
// deletes T[from_index] through T[to_index]
// for example if from_index is 1 and to_index is 3, deletes T[1], T[2]
void delIndexBetween(vi T, int from_index, int to_index) {
  T.erase(T.begin() + from_index, T.begin() + to_index);
}
void delIndex(vi T, int index) {
  T.erase(T.begin() + index);
}
void del(vi T, int num) {
  int id = -1;
  rep(i, T.size()) {
    if (num == T[i]) {
      id = i;
      break;
    }
  }
  if (id != -1) delIndex(id);
}
*/

int main() {
  ios::sync_with_stdio(false);
  int c = 0;
  vi A;

  // comment out below when input is given in the format n k
  /* n k */
  // int k;
  // cin >> n >> k

  int n;
  cin >> n;

  // receiving input
  while (c < n) {
    int tmp;
    cin >> tmp;
    A.pb(tmp);
    c++;
  }

  // for result output like below
  /*
     p1 500
     p2 1000
     p3 1000
  */

  // rep(i, n) {
  //   cout << C[i].name << " " << C[i].ms << endl;
  // }

  return 0;
}
