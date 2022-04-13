# ファイル名を入力してもらう
puts "please input file name."
input = gets.chomp

# ファイル一覧をリストで取得（foreachなどでもファイル取得できるが、リストで取得する場合にはentriesが簡単）
i = 0
Dir.foreach(".").sort_by { |f| File.mtime(f) }.each do |file|
    if File::ftype(file) == "file" then
        if file != "FileNumberingByDate.rb" then
            ext = File.extname(file)
            File.rename(file, input + i.to_s + ext)
            i = i+1
        end
    end
end
puts "done."
