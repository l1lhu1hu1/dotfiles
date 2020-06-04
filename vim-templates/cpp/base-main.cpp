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

int main() {
  ios::sync_with_stdio(false);
  int cntC = 0;
  vi VA;

  int n;
  cin >> n;

  while (cntC < n) {
    int tmp;
    cin >> tmp;
    VA.pb(tmp);
    cntC++;
  }

  return 0;
}
