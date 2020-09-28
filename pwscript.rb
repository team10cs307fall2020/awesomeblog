SOURCE = "abcdefghijklmnopgrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
ENCODE = SOURCE.split('').shuffle.join



def encode(pw)
  pw.tr(SOURCE, ENCODE)
end

def decode(pw)
  pw.tr(ENCODE, SOURCE)
end

def match(pw1, pw2)
    pw1 == pw2
end


def restric(pw)
    if pw =~ /\A(?=.{8,}) (?=.*[[:^alnum:]])/x    #8 length mininum with one special char
        puts "auth"  #on
        return 1
    else 
        puts "fail"
        return 0
    end
end

#validate :password, format: {with = /\A(?=.{8,})/x }



test = "12bd78"

test1 = encode(test)
test2 = decode(test1)

puts(test1)
puts(test2)
