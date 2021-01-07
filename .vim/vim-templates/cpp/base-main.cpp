#include <bits/stdc++.h>
using namespace std;

typedef long long ll;
typedef vector<int> vi;
typedef vector<string> vs;

#define FOR(i, a, b) for (int i = (a); i < (b); i++)
#define rep(i, n) FOR(i, 0, n)
#define pb push_back
#define all(a) (a).begin(), (a).end()
#define UNIQUE(v) v.erase(unique(all(v)), v.end());
#define fill(a, x) memset(a, x, sizeof(a))
#define zero(a) fill(a, 0)
#define minus(a) fill(a, -1)
#define dbg(x) cout << #x "=" << x << endl

int main() {
  int cnt = 0;
  vi vc;

  int n;
  cin >> n;

  while (cnt < n) {
    int tmp;
    cin >> tmp;
    vc.pb(tmp);
    cnt++;
  }

  return 0;
}
