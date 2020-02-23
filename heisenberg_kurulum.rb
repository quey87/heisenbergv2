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
    system("mv heisenberg.rb /$HOME/sqlmap")
    sleep(1)
    system("cd /$HOME/sqlmap")
    puts "KURULUM TAMAMLANDI !"
    sleep(1)
    system("ruby heisenberg.rb")
elsif islem == "3"
    system("gem install colorize")
    system("gem install os")
    puts "KURULUM TAMAMLANDI !"
end