#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
typedef vector<int> vi;
typedef vector<string> vs;
#define FOR(i,a,b) for(int i=(a);i<(b);i++)
#define rep(i,n) FOR(i,0,n)
#define pb push_back
#define all(a) (a).begin(),(a).end()
#define UNIQUE(v) v.erase(unique(all(v)),v.end());
#define fill(a,x) memset(a,x,sizeof(a))
#define zero(a) fill(a,0)
#define minus(a) fill(a,-1)
#define dbg(x) cout << #x"=" << x << endl

int main(){
  int n;
  cin>>n;
  //最初の入力がn kのように与えられている場合のみコメントアウトする
  //int k;
  //cin >> k;
  //結果の出力用
  //int res;
  int count=0;
  int tmp;
  vi a;
  while(count<n){
    cin>>tmp;
    a.pb(tmp);
    count++;
  }

  rep(i,n) cout<<a[i]<< endl;
  return 0;
}
