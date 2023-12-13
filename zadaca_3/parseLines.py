def _parse_lines(self):
    self._comment = False    
    self._iter_lines(self._parse_line)

    self._while_counter = 0
    self._iter_lines(self._parse_macro)

def _parse_line(self, line, p, o):
    l = ""
    i = 0
    while i < len(line) - 1:
        p = line[i] + line[i + 1]

        if (self._comment == False and p == "/*") or (self._comment and p == "*/"):
            self._comment = not self._comment
            i += 1
        elif self._comment == False and p == "*/":
            self._flag = False
            self._line = o
            self._errm = "Unbalanced comment delimiter"
        elif (p == "//"):
            break
        elif line[i].isspace() == False and self._comment == False:
            l += line[i]

        i += 1
    return l

def _parse_macro(self, line, p, o):
    if line[0] != "$":
        return line

    split_1 = line[1:].split("(")
    try:
        naredba = split_1[0]
        list_of_args = split_1[1][:-1].split(",")
    except:
        list_of_args = ""

    l = ""
    if naredba == "WHILE":
        self._while_counter += 1
        n = split_1[1][:-1]
        l = f"(WHILE_{self._while_counter}_START)\n@{n}\nD=M\n@WHILE_{self._while_counter}_END\nD;JEQ"
        return l.split("\n")
    elif naredba == "END":
        l = f"@WHILE_{self._while_counter}_START\n0;JMP\n(WHILE_{self._while_counter}_END)"
        self._while_counter -= 1
        return l.split("\n")

    elif naredba == "SWP":
        if len(list_of_args) == 2:
            c, d = list_of_args
            # c -> var, d -> c, var -> d
            l = f"$MV({c},{self._num_vars})\n$MV({d},{c})\n$MV({self._num_vars},{d})"
            self._num_vars += 1 
            final_instructions = []
            for i in l.split("\n"):
                final_instructions.extend(self._parse_macro(i, p, o))
            return final_instructions
        else:
            self._flag = False
            self._line = o
            self._errm = "Invalid arguments"  
        
    elif naredba == "SUM":
        if len(list_of_args) == 3:
            a, b, d = list_of_args
            l = f"@{a}\nD=M\n@{b}\nD=M+D\n@{d}\nM=D"

            return l.split("\n")
        else:
            self._flag = False
            self._line = o
            self._errm = "Invalid arguments"

    elif naredba == "MV":
        if len(list_of_args) == 2:
            c, d = list_of_args
            print(c, d)
         
            if "@" in c:
                first_var = f"{c}\nA=M"
            else:
                first_var = f"@{c}"

            if "@" in d:
                second_var = f"{d}\nA=M"
            else:
                second_var = f"@{d}"

            l = f"{first_var}\nD=M\n{second_var}\nM=D"
            return l.split("\n")
        else:
            self._flag = False
            self._line = o
            self._errm = "Invalid arguments"
    else:
        print(line)
        self._flag = False
        self._line = o
        self._errm = "Invalid macro"

    return l