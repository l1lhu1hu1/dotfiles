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

int charToInt(char a) {
  string tmp;
  tmp += a;
  int b = atoi(tmp.c_str());
  return b;
}

int main() {
  /*入力を受け取るための処理 start*/
  int n;
  int c = 0;
  vi  a;
  cin >> n;

  /*extra start*/
  // 最初の入力がn kのように与えられている場合のみコメントアウトする
  // int k;
  // cin >> k;
  // res: 結果の出力用
  // int res;
  /*extra end*/

  while (c < n) {
    int tmp;
    cin >> tmp;
    a.pb(tmp);
    c++;
  }
  /*入力を受け取るための処理 end*/

  rep(i, n) {
    cout << a[i] << endl;
  }
  return 0;
}
