module Texst
    module Available
    	class Parameter
            # To Wellcome For Users
    		def self.input
              puts "+---------------------------------------------------------+"
              puts "|\t| Hello Wellcome To Programing File Creator|\t  |"
              puts "+---------------------------------------------------------+"
            end
            
    	end
    end
    module Format
    	class Program
             # For Create Folder For Langs
             def self.folder
                  filer = Dir.pwd
                  Dir.mkdir("#{filer}/texst")
                  folders = ["c", "lisp", "c++", "java", "cobol",
                             "cs", "d", "exilir", "haskell", "erlang", "clujure",
                             "matlab", "pascal", "r", "scala", "swift",
                             "python", "php", "perl", "lua", "ruby"]
                  folders.each do |fld|
                    path = Dir.pwd
                    Dir.mkdir("#{path}/texst/#{fld}") unless File.exists?("#{path}/texst/#{fld}")
                  end
             end
             # For Begin Get Type And Lang If Was Right First Time
             def self.init
                folder               
                @type_arr = ["functional", "oop"]
                 print "Enter Your Type [functional] or [oop] : "
                 $type = gets.chomp
                 if $type == "functional"
                   print "Enter Your Lang [ c | haskell | erlang | clojure ] : "
                 elsif $type == "oop"
                   print "Enter Your Lang [c++ | java | python | ruby | php | prel | elixir | lisp | d | r | swift | scala | lua | pascal | matlab | cobol | cs |]: "
                 else 
                 while !@type_arr.include?($type)  
                 print "Plese Enter Right Charachter [functional] or [oop]:"
                 $type = gets.chomp
                 end
                 erase
                 end
                 $lang = gets.chomp
                 @lang_arr = ["c++", "java", "python", "ruby", "php", "perl", "elixir",
                              "lisp", "d", "r", "swift", "scala", "lua",
                              "pascal", "matlab", "cobol", "cs"]
                 @lang_arr_f = ["c", "haskell", "erlang", "clojure"]
                 lang_check
             end
             # This Function For Print Details  Before Get Right Type
             def self.erase
                 if $type == "functional"
                   print "Enter Your Lang [ c | haskell | erlang | clojure ] : "
                 elsif $type == "oop"
                   print "Enter Your Lang [c++ | java | python | ruby | php | prel | elixir | lisp | d | r | swift | scala | lua | pascal | matlab | cobol | cs |]: "
                 end
             end
             # This Function Check For Input Right Lang For Type
             def self.lang_check
                if $type == "functional"
                   case $lang
                     when "c"
                     when "lisp"
                     else
                       while !@lang_arr_f.include?($lang) 
                        print "Plese Enter Right Lang :"
                        $lang = gets.chomp
                       end
                    end
                elsif $type == "oop"
                    case $lang
                      when "c++"
                      when "java"
                      else
                        while !@lang_arr.include?($lang) 
                         print "Plese Enter Right Lang :"
                         $lang = gets.chomp
                         end
                    end
                end
             end
             # This Function For Get Inputs
             def initialize(lang, type)
             	@type = type
                @filename = "texst/#{$lang}/"
             	 if lang == "functional"
                     @lang = lang

                     functional
                 elsif lang == "oop"
                     @lang = lang

                     oop
             	 end
             end
             # Make Priject Dir
             def project_dir
                    print "Enter Project Name : "
                    @project_name = gets.chomp
                    make = Dir.pwd
                    if File.exists?("#{make}/texst/#{$lang}/#{@project_name}")
                        print "Project Exist Do You Want To Merge?[y/n] : "
                        answer = gets.chomp
                        if answer == "y"
                           Dir.mkdir("#{make}/texst/#{$lang}/#{@project_name}") unless File.exists?("#{make}/texst/#{$lang}/#{@project_name}")
                           @filename += @project_name + "/"
                           print "Enter Main Filename :"                                
                        elsif answer == "n"
                            project_dir
                        else
                            project_dir
                        end                    
                    else
                           Dir.mkdir("#{make}/texst/#{$lang}/#{@project_name}") unless File.exists?("#{make}/texst/#{$lang}/#{@project_name}")
                           @filename += @project_name + "/"
                           print "Enter Main Filename :" 
                    end

             end
             # This Function For Create File And Open And Exit From Editor
             def run_func
                    project_dir
             	 	@filename += gets.chomp + @run_exep
             	 	text = File.open(@filename, "w+")
                    puts "Write [quit] Or [exit] And Enter To Exit Editor"
             	 	puts "Plese Enter #{@run_lang} Code"
                    i = 1
                    @code = ""
                    loop do    
                       print i, " -> "
                       #plain 

             	 	   @code = gets.chomp + "\n"
                       if @code == "quit\n" || @code == "exit\n"
                            puts "GoodBye"
                            exit
                       end

                       # Hard way

                       # @code = gets.chomp + "\n"
                       # if @code.chomp.eql? "quit"
                       #      puts "GoodBye"
                       #      exit
                       # end

                       i += 1          	 	   
                       text.syswrite(@code)
                    end
             end
             # This Function Is For Indicate Functional Langs
             def functional
             	 case @type
             	 when "c"
                    @run_exep = ".c"
             	 	@run_lang = "C"
                      run_func
                when "haskell"
                    @run_exep = ".hs"
                    @run_lang = "Haskell"
                    run_func
                when "erlang"
                    @run_exep = ".erl"
                    @run_lang = "Erlang"
                    run_func
                when "clojure"
                    @run_exep = ".clj"
                    @run_lang = "Clojure"
                    run_func                                                             
             	 end
             end
             # This Function Is For Indicate Objective Langs
             def oop
             	case @type
             	when "c++"
             		@run_exep = ".cpp"
             		@run_lang = "c++"
             		run_func
             		  
             	when "java"
             		@run_exep = ".java"
             		@run_lang = "java"
             		run_func
                when "cs"
                    @run_exep = ".cs"
                    @run_lang = "cs"
                    run_func
                when "cobol"
                    @run_exep = ".cobol"
                    @run_lang = "Cobol"
                    run_func
                when "pascal"
                    @run_exep = ".pas"
                    @run_lang = "Pascal"
                    run_func                                       
                when "swift"
                    @run_exep = ".swift"
                    @run_lang = "Swift"
                    run_func
                when "python"
                    @run_exep = ".py"
                    @run_lang = "Python"
                    run_func
                when "php"
                    @run_exep = ".php"
                    @run_lang = "PHP"
                    run_func
                when "ruby"
                    @run_exep = ".rb"
                    @run_lang = "Ruby"
                    run_func
                when "scala"
                    @run_exep = ".scala"
                    @run_lang = "Scala"
                    run_func
                when "r"
                    @run_exep = ".r"
                    @run_lang = "R"
                    run_func
                when "lisp"
                    @run_exep = ".lisp"
                    @run_lang = "Lisp"
                    run_func
                when "d"
                    @run_exep = ".d"
                    @run_lang = "D"
                    run_func
                when "elixir"
                    @run_exep = ".ex"
                    @run_lang = "Elixir"
                when "perl"
                    @run_exep = ".pl"
                    @run_lang = "Perl"
                    run_func                    
                when "lua"
                    @run_exep = ".lua"
                    @run_lang = "Lua"
                    run_func
                when "matlab"
                    @run_exep = ".m"
                    @run_lang = "Matlab"
                    run_func
                end                    
             end
        # This Class For Start program
        class << self
             def start
                 Texst::Available::Parameter.input
                 Texst::Format::Program.init
                 if $type and $lang
                  Texst::Format::Program.new($type, $lang)
                 end
             end
        end

    	end
    end
end
# To Start This Program Write This Line
Texst::Format::Program.start