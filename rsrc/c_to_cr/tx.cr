class CFunction
  property? return_type_is_array : Bool = false
  property? return_type_is_2d_array : Bool = false
  property return_type : String = ""
  property name : String = ""
  property args : Array(CArg) = [] of CArg
end

class CArg
  property name : String = ""
  property? type_is_array : Bool = false
  property? type_is_2d_array : Bool = false
  property type : String = ""
end

def c_type_to_cr(c_type : String)
  if c_type == "void"
    "Void"
  elsif c_type == "bool"
    "Bool"
  elsif c_type == "char"
    "LibC::Char"
  elsif c_type == "unsigned char"
    "LibC::UChar"
  elsif c_type == "int"
    "LibC::Int"
  elsif c_type == "unsigned int"
    "LibC::UInt"
  elsif c_type == "long"
    "LibC::Long"
  elsif c_type == "unsigned long"
    "LibC::ULong"
  elsif c_type == "float"
    "LibC::Float"
  elsif c_type == "double"
    "LibC::Double"
  else
    c_type # Return the c type because the structs are named the same
  end
end

File.open("./good.txt", "w+") do |output|
  File.open("./better.txt", "r") do |file|
    file.gets_to_end.gsub("const ", "").each_line do |line|
      if line =~ /;/
        c_function = CFunction.new
        c_return_type_and_function_name = line.split("(")[0].split(" ")
        c_function.name = c_return_type_and_function_name.pop
        if c_function.name =~ /\*\*/
          c_function.name = c_function.name.lchop("**")
          c_function.return_type_is_2d_array = true
        elsif c_function.name =~ /\*/
          c_function.name = c_function.name.lchop("*")
          c_function.return_type_is_array = true
        end
        c_function.return_type = "#{c_return_type_and_function_name.join(" ")}"
        c_args_raw = line.split("(")[1].split(")")[0].split(",").map(&.lchop(" "))
        unless (c_args_raw.size == 1 && c_args_raw[0] =~ /^void$/)
          c_args_raw.each do |arg_raw|
            c_arg_raw = arg_raw.split(" ")
            c_arg = CArg.new
            c_arg.name = c_arg_raw.pop
            if c_arg.name =~ /\*\*/
              c_arg.name = c_arg.name.lchop("**")
              c_arg.type_is_2d_array = true
            elsif c_arg.name =~ /\*/
              c_arg.name = c_arg.name.lchop("*")
              c_arg.type_is_array = true
            end
            c_arg.type = "#{c_arg_raw.join(" ")}"
            c_function.args << c_arg
          end
        end
        if c_args_raw.any? { |a| a == "..." }
          output << "###### "
        end

        output << "fun #{c_function.name.underscore}"

        if !c_function.return_type_is_array? && !c_function.return_type_is_2d_array?
          if c_function.return_type == "bool"
            output << "?"
          end
        end

        output << " = #{c_function.name}("

        c_function.args.each_with_index do |arg, index|
          output << "#{arg.name.underscore} : #{c_type_to_cr(arg.type)}"
          if arg.type_is_array?
            output << "*"
          elsif arg.type_is_2d_array?
            output << "**"
          end

          unless index == (c_function.args.size - 1)
            output << ", "
          end
        end

        output << ")"
        if c_function.return_type == "void" && !c_function.return_type_is_array? && !c_function.return_type_is_2d_array?
          # Do nothing
        else
          output << " : #{c_type_to_cr(c_function.return_type)}"
          if c_function.return_type_is_array?
            output << "*"
          elsif c_function.return_type_is_2d_array?
            output << "**"
          end
        end
        output.puts
      end
    end
  end
end
