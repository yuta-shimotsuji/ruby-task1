require "csv"

# ----------------------(アプリ起動)------------------------ #

p "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i 

# ----------------------(新規作成)------------------------ #

if memo_type == 1
 p "拡張子を除いたファイルを入力してください" 
 
 file_name = gets.chomp
 
 p "メモしたい内容を記入してください"
 p "Ctrl+Dで入力を完了します"
 
 CSV.open("#{file_name}.csv",'w') do |input|
   input << readlines
 end
 
# ----------------------(既存ファイルの編集)------------------------ #

elsif memo_type == 2
 p "拡張子を除いたファイル名を入力してください"
 edit_name = gets.chomp
  
 CSV.foreach("#{edit_name}.csv") do |edit|
   puts edit
 end
  
  p "追記したい内容を記入してください"
  p "Ctrl+Dで入力を完了します"
  
  CSV.open("#{edit_name}.csv",'a') do |input|
   input << readlines
  end
 
end