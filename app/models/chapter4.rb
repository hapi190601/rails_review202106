# class Chapter4 < ApplicationRecord
# ４章配列の繰り返し処理

puts [].class

# 配列の中に配列を入れることも可能
arraies = [ [1, 2, 3], [4, 5, 6], [7, 8, 9] ]
puts arraies
puts arraies[2]

# 配列の要素削除
a = [1, 2, 3]
a.delete_at(0)
puts a

# 値の更新・追加
b = [1, 2, 3]

b[0] = 50
puts b

# インデックス番号を指定して追加
b = [1, 2, 3]
b[3] = 4
puts b

# 配列の最後に要素を追加
b = []
b << 1
b << 10
b << 100
puts b

# ブロック(下記each文のdo~endまでを意味する)
numbers = [1 ,2, 3, 4, 5, 6]
sum = 0

numbers.each do |n|
  sum += n
end

puts sum

# 配列の要素削除
# delete, delete_at, delete_ifの違い
# delete()は引数の値と完全一致した値を削除
# delete_at()は引数の値をインデックス番号として配列を参照し、該当する要素を削除する
# delete_ifはdo~end(ブロック)を使い、様々な条件を指定可能

numbers = [1 ,2, 3, 4, 5, 6]
sum = 0

# do~endは{ }で書き換えることも可能(１行でまとめたいときなどに使うらしい)
numbers.each { |n|
  sum += n
}

puts sum

# mapメソッド(collectでも可＝エイリアスメソッド)
# 各要素に対してブロック内の処理をした戻り値を配列の要素とする新しい配列を作る
numbers = [1, 2, 3, 4, 5]

# new_numbers = numbers.map do |n| n * 10 end
new_numbers = numbers.map { |n| n * 10 }
puts new_numbers

# selectメソッド(エイリアスメソッドはfind_allメソッド)
# 各要素に対してブロックを評価し、その戻り値が真である要素を集めた配列を返す。

numbers = [1, 2, 3, 4, 5, 6]

# do ~ endの書き方でも可
even_numbers = numbers.select { |n| n.even? }
even_numbers = numbers.find_all { |n| n.even? }
puts even_numbers

# rejectメソッド
# 上記selectメソッドの逆
# 各要素に対してブロックを評価し、その戻り値が真である要素を「除外した」配列を返す。

numbers = [1, 2, 3, 4, 5, 6]
non_multiples_of_three = numbers.reject { |n| n % 3 == 0}
puts non_multiples_of_three

# findメソッドはブロックの戻り値が真になった最初の要素を返す。
# エイリアスメソッドはdetectメソッド

# 範囲(Range)
# 最初の値..最後の値(最後の値含む)
# 最初の値...最後の値(最後の値含まない)

# 範囲オブジェクトに変数を入れない場合は()で囲む必要がある
# ↓エラーになる
# 1..5.include?
# ↓正
# (1..5).include?

a = [1, 2, 3, 4, 5]

print a[0..2]
print a[0...2]

a = "abcdef"
print a[1..3]
print a[1...3]


# 「n以上m以下」などの判定をするメソッドの場合、<=などの比較演算子よりも範囲メソッドの方が便利

# ↓比較演算子の場合
# def liquid(temperature)
#   0 <= temperature && temperature < 100
# end

# ↓範囲メソッドの場合
def liquid(temperature)
  (0...100).include?(temperature)
end

puts liquid(50)
puts liquid(101)

# 範囲オブジェクトに対してto_aメソッドを呼び出すと値が連続する配列を作ることができる
a = (1..5).to_a
puts a
# 出力結果 [1, 2, 3, 4, 5]


# 配列[位置, 取得する長さ]
a = [1, 2, 3, 4, 5]
# インデックス番号「1」から 「3」つの要素を取り出す
# 出力結果 [2, 3, 4]
puts a[1, 3]

# values_atメソッドはインデックス番号を複数指定し、該当する要素をすべて取り出す
# 出力結果 [1, 3, 5]
puts a.values_at(0, 2, 4)

# 配列の長さ−１で最後の要素を取得することができる
# 出力結果5
puts a[a.size - 1]

# インデックス番号に負の値を設定すると最後の要素から参照して取得ができる
# 最後の値のときは0ではなく、-1から
puts a[-1]
# 出力結果5
puts a[-2]
# 出力結果4

# lastメソッド,firstメソッド
# 配列の最後や最初の要素を取得することができる
puts a.last
# 出力結果5
puts a.last(2)
# 出力結果[4, 5]
puts a.first
# 出力結果1
puts a.first(2)
# 出力結果[1, 2]

# 要素の置き換え
a = [1, 2, 3, 4, 5]
# インデックス番号1から3要素(2,3,4)を100に置き換える
a[1, 3] = 100
print a
# 出力結果[1, 100, 5]

# pushメソッドによる要素の追加(<<でも可)
a = []
a.push(1, 2)
# 出力結果[1,2]
print a

# 配列の連結(concatメソッド)
a = [1, 3]
b = [2, 4]

p a.concat(b)
# 出力結果[1, 3, 2, 4]
p a
# 出力結果[1, 3, 2, 4]
# concatメソッドは「破壊的メソッド」であるため、変数aは元の配列から変更されてしまう
p b
# 出力結果[2, 4] (concatメソッドの引数に指定したbはそのまま)

# +を使っての連結はどちらも破壊されない！！基本的には+を使うことがおすすめ！


# 配列の和集合、差集合、積集合
a = [1, 2, 3]
b = [3, 4, 5]

# 和集合 |
# ２つの配列の要素を全て集め、重複しないようにして返す
p a | b
# 出力結果[1, 2, 3, 4, 5]

# 差集合 -
# 左の配列から右の配列に含まれる要素を取り除いて返す
p a - b
# 出力結果[1, 2]

# 積集合 &
# 2つの配列に共通する要素を返す
p a & b
# 出力結果[3]


# 多重代入で切り捨てられる値を配列として受け取る

# 400は切り捨てられてしまう
e, f = 200, 300, 400

# *をつけると切り捨てられる要素も含めて配列として受け取る
e, *f = 200, 300, 400

p e
p f
# 出力結果[300, 400]

# 文字列を配列に変換する(charsメソッド、splitメソッド)

# charsメソッドは文字列を一文字ずつ分解する
p "Ruby".chars
# 出力結果["R", "u", "b", "y"]

# splitメソッドは引数で渡した区切り文字(,)で文字列を分解する
p "Ruby,Java,PHP,Go".split(",")
# 出力結果["Ruby", "Java", "PHP", "Go"]

# 配列に初期値を設定する
# a = [] と同じ
a = Array.new

# 配列に5つの要素を追加する(nil)
a = Array.new(5)

# 第二引数が初期値になる
a = Array.new(5, 0)
p a
# 出力結果[0, 0, 0, 0, 0]

# 第二引数の代わりにブロックを使うことで初期値を設定することも可能
a = Array.new(10) { |n| n % 3 + 1}
p a
# 出力結果[1, 2, 3, 1, 2, 3, 1, 2, 3, 1]


# each_with_index(a, b)メソッド
# aはブロック変数、bには0,1,2...とインデックス番号が入る

fruits = ["apple", "orange", "melon"]

fruits.each_with_index do |fruit, i|
  p "#{i}：#{fruit}"
end

# # 処理結果
# "0：apple"
# "1：orange"
# "2：melon"

# mapメソッドと組み合わせて使うときはwith_indexメソッドを使う
fruits = ["apple", "orange", "melon"]

fruits.map.with_index do |fruit, i|
   puts "#{i}：#{fruit}"
end

# インデックス番号を0以外から始める場合
# each_with_indexメソッドに引数は渡せないため、each.with_index(引数)と書く
# with_indexメソッドに引数を渡すイメージ
fruits.each.with_index(10) do |fruit, i|
   puts "#{i}：#{fruit}"
end

fruits.map.with_index(10) do |fruit, i|
   puts "#{i}：#{fruit}"
end

# eachメソッドとmapメソッドの違い
# eachメソッドは要素を順番に取り出す役割(mapメソッドのように新しい配列を返したりなどはしない)、その後の処理はブロック(do~end)内に準ずる
# mapメソッドは繰り返し処理をした値を新しい配列の要素とし、新しい配列を返す

# timesメソッド(繰り返し処理)
sum = 0

5.times do |n|
  sum += n
end

# uptoメソッド、downtoメソッド(nからmまで数値を増やしたり減らしたりする処理)
a = []
10.upto(14) do |n|
  a << n
end

# [10, 11, 12, 13, 14]
p a

b = []
14.downto(10) do |n|
  b << n
end

# [14, 13, 12, 11, 10]
p b

# stepメソッド(nからmまでx個ずつ増やしたり減らしながら処理を行う)
# テンプレ：開始値.step(上限値, 1度に増減する大きさ)

# 増やす
a = []
1.step(10, 2) do |n|
  a << n
end

# [1, 3, 5, 7, 9]
p a

# 減らす
b = []
10.step(1, -2) do |n|
  b << n
end

# [10, 8, 6, 4, 2]
p b

# while文(条件に合えば繰り返し処理)
# until文(条件に合わなければ繰り返し処理)
a = []
i = 1

while a.size < 5
  a << i
  i += 1
end

p a

# 繰り返し処理用の制御構造(繰り返し処理の動きを変えるもの)
# １：break
# 繰り返し処理を脱出するメソッド
# each,while,for,untilなど多くの繰り返し処理で使うことができる
# 繰り返し内に繰り返しがある場合、breakで脱出する処理は一番内側の繰り返し処理になり、それ以外の処理は継続となる

numbers = [1, 2, 3, 4, 5].shuffle

numbers.each do |number|
  p number
  break if number == 5
end

# throwとcatchを使った脱出
# 全ての繰り返し処理(複数の繰り返し処理)を脱出したい場合にbreakの代わりに使う
# タグにはシンボル(:)を使い、変数のように自由に指定できる(例 :done)
# catchのタグとthrowのタグが一致しない場合はエラーになる

# テンプレ
# catch タグ do
# 　処理
#   throw タグ
# end

# nextメソッド
# 繰り返し処理を途中で中断し、次の繰り返し処理を進める処理

numbers = [1, 2, 3, 4, 5, 6]

numbers.each do |number|
  next if number.even?
  p number
end

# end