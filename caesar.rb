require 'sinatra'
require 'sinatra/reloader' if development?

def caesar_cipher(sentence, shift)

    niz = []
    sentence.chars.each do |letter|
        pom = letter.ord
        if (pom >=65 && pom <= 90)
          pom = pom +shift
          if pom >90
            pom = 64 + (pom%90)
          end
        end
        if (pom >=97 && pom <=122)
          pom = pom + shift
          if pom > 122
            pom = 96 + (pom%122)
          end
        end
        niz << pom.chr

   end
   niz.join()

end
before do

  @string = caesar_cipher(params['string'],params['shift'].to_i) if params['string']!=nil

end

ispis =   caesar_cipher("Hello world!",1)
get '/' do
  erb :index , :locals => {:coded => @string}
end
