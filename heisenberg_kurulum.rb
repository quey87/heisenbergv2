system("cls")
system("clear")
puts"
1) Windows
2) Termux
3) Linux
"
print "İşlem : "
islem = gets.chop

if islem == "1"
    system("gem install colorize")
    system("gem install os")
    sleep(1)
    puts "SQLMAP'İ İNDİR VE HEİSENBERG PROGRAMINI SQLMAP.PY İLE AYNI KLASÖRE AT."
elsif islem == "2"
    system("gem install colorize")
    system("gem install os")
    system("pkg install figlet -y")
    system("git clone https://github.com/sqlmapproject/sqlmap")
    system("mv heisenberg.rb sqlmap")
    system("clear")
    puts "cd sqlmap KODUNU YAZARAK KLASÖRE GİRİN ARDINDAN HEİSENBERG.RB PROGRAMINI ÇALIŞTIRIN."
    puts "KURULUM TAMAMLANDI !"
    sleep(5)
elsif islem == "3"
    system("gem install colorize")
    system("gem install os")
    puts "KURULUM TAMAMLANDI !"
end