#!/usr/bin/env ruby
require 'net/http'
require 'json'
require 'uri'

valueExists = false
url = 'none'

spinningMonke = ["|", "/", "-", "\\"]
spinningMonkeNum = 0

ARGV.each do |value|
    if(!valueExists)
        valueExists = true
        url = value
    end
end

uri = URI.parse("https://api.sagin.pl/v1")
request = Net::HTTP::Get.new(uri)
request["Accept"] = "application/json"

req_options = {
    use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
end

if(response.body == '{"Mordo":"ApiOddycha"}')
    if(url == 'none')
        puts 'Podaj URL'
        print '>> '
        url = STDIN.gets.chomp
    end

    uri = URI.parse("https://api.sagin.pl/szurag")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Accept"] = "application/json"
    request.body = JSON.dump({
        "url" => url
    })

    req_options = {
        use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
    end

    if(response.body[2..6] == 'Mordo')
        quality = 'none'

        puts 'Wybierz jakość: hd/best'
        print '>> '
        quality = STDIN.gets.chomp

        while(true)
            if(quality == 'hd' || quality == 'best')
                break
            end

            puts 'Niepoprawne użycie: hd/best'
            print '>> '
            quality = STDIN.gets.chomp
        end

        uri = URI.parse("https://api.sagin.pl/szuragV2")
        request = Net::HTTP::Post.new(uri)
        request.content_type = "application/json"
        request["Accept"] = "application/json"
        request.body = JSON.dump({
            "settings" => quality,
            "url" => url
        })

        req_options = {
            use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
            http.request(request)
        end

        res = JSON.parse(response.body)

        puts

        url = res["url"]
        percentValue = -1
        downloadStarted = false
        while(true)
            if(spinningMonkeNum==3)
                spinningMonkeNum = 0
            else
                spinningMonkeNum = spinningMonkeNum +1
            end
            sleep(rand(0.4..0.5))

            uri = URI.parse(url)
            request = Net::HTTP::Get.new(uri)
            request["Accept"] = "application/json"
        
            req_options = {
                use_ssl: uri.scheme == "https",
            }
        
            response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
                http.request(request)
            end

            if(response.body.length>40)
                percent = response.body[40..42]

                if(percent[0] == '0')
                    if(percentValue!=0 && !downloadStarted)
                        downloadStarted = true
                        percentValue=0
                        print spinningMonke[spinningMonkeNum]+" <----------> #{percentValue}% \r"
                        $stdout.flush
                    else
                        if(percentValue<=37)
                            percentValue = percentValue + rand(3)
                        end

                        out = spinningMonke[spinningMonkeNum]+' <'
                        progress = percentValue/10

                        for i in 0..9 do
                            if(progress>0)
                                out = out + '#'
                                progress = progress -1
                            else
                                out = out + '-'
                            end
                        end

                        out = out + "> #{percentValue}%"
                        print out+"\r"
                        $stdout.flush
                    end
                elsif(percent[0] == '5')
                    if(percentValue!=5 && !downloadStarted)
                        downloadStarted = true
                        percentValue=5
                        print spinningMonke[spinningMonkeNum]+" <----------> #{percentValue}% \r"
                        $stdout.flush
                    else
                        if(percentValue<=37)
                            percentValue = percentValue + rand(3)
                        end

                        out = spinningMonke[spinningMonkeNum]+' <'
                        progress = percentValue/10

                        for i in 0..9 do
                            if(progress>0)
                                out = out + '#'
                                progress = progress -1
                            else
                                out = out + '-'
                            end
                        end

                        out = out + "> #{percentValue}%"
                        print out+"\r"
                        $stdout.flush
                    end
                elsif(percent[1] == 'h')
                    print response.body[41..-17]
                    $stdout.flush
                    puts
                    break
                else
                    out = spinningMonke[spinningMonkeNum]+' <'
                    percentValue = response.body[40..-2].to_i
                    progress = percentValue/10

                    for i in 0..9 do
                        if(progress>0)
                            out = out + '#'
                            progress = progress -1
                        else
                            out = out + '-'
                        end
                    end

                    out = out + "> #{percentValue}%"
                    print out+"\r"
                    $stdout.flush
                end
            else
                puts 'Wystąpił problem: ', response.body
                break
            end
        end
    else
        #TU JESZCZE ZABEZPIECZENIE CZY TO NA PEWNO DZIAŁA PRZY TIKTOKU
    end
else
    puts 'Nie można połączyć z serwerem API, spróbuj ponownie później'
end