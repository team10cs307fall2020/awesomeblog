SOURCE = "abcdefghijklmnopgrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
ENCODE = SOURCE.split('').shuffle.join

require 'digest'


def encode(pw)
  pw.tr(SOURCE, ENCODE)
end

def decode(pw)
  pw.tr(ENCODE, SOURCE)
end

def match(pw1, pw2)
    pw1 == pw2
end

def hash(pw)
  Digest::MD5.hexdigest(pw)
end

#merge into database table
def merge
  add_column :username, :password_md5, :string
end

def restric(pw)
    if pw =~ /\A(?=.{8,}) (?=.*[[:^alnum:]])/x    #8 length mininum with one special char
        #puts "auth"  #on
        return 1
    else 
        #puts "fail"
        return 0
    end
end

#validate :password, format: {with = /\A(?=.{8,})/x }



test = "12bd78"


