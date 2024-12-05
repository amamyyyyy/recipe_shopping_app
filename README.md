# アプリケーション名
レシピ&買い物リストアプリ

# 概要
このアプリケーションは、ユーザーがレシピを登録し、それに基づいた買い物リストを表示できる Rails 7 アプリケーションです。

# 利用方法
## 自分だけのレシピ専用メモ
・他のユーザーからは自分の登録したレシピを見られないように最初にログインをする  
・本、雑誌、インターネットやYouTubeから自分の好みのレシピを登録して自分だけのレシピ帳を作り上げる  
・登録したレシピの材料から買い物リストを作成する

# アプリケーションの作成背景
私は、自分の翌週に昼食用の弁当を休日にまとめて調理をするのですが、レシピを探してから材料を揃えるまでの工程を少しでも減らすことができないかずっと考えていました。  
具体的な工程は以下のような流れがあります。  
①本、雑誌、インターネットやYouTubeなどを見て作るレシピを決める  
②レシピに載っている材料や、作り方をメモアプリやノートにメモをする  
③必要な食材を調達するため買う物をリストアップする。  
上記作業をするのに1時間近く取られてしまい、そこから買い物や調理の時間を加えると休日の午前を丸々費やしてしまうため、少しでも手間と時間を減らしたいと考えました。  
そこで、レシピを登録して、自動的に必要な食材がリストアップされるようにすることで、買い物に行くまでの工数を減らすことができるのではないかと考えました。

# 今後実装予定の機能
・複数のレシピを基にした買い物リストの作成機能  
・楽天レシピAPIを利用したレシピの登録機能及び登録したレシピを基にした買い物リストの作成  

# 楽天レシピAPIを導入する理由
・日本のAPIなので、味付けが日本人好みのものが多い  
・検索できるレシピが1レシピにつき4個しかないが、人気のレシピ上位4個なので人気で多くの人がやっている作り方が検索できる  

# 工夫したポイント
・楽天APIのデータレスポンスがJSON形式を採用している観点から、アプリの仕様を統一させて、アプリをシンプルにするようにしたところ  
・レシピの材料を登録する方式をJSON形式にしたため、買い物リストに変換するためのロジックを組むところ  


# 今後の改善点
・レシピの材料と買い物リストとの互換性を高めること  
・レシピ登録時の材料入力のやりやすさを追求すること    