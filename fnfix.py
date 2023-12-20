import sys
lib = sys.argv[3] if len(sys.argv) > 3 else exit(1)
def publify(lines):
        return [line.replace("fn", "pub fn") if line.startswith("fn") else line for line in lines]

def delib(lines):
        return [line.replace(f"{lib}_", "") for line in lines]

def dot(lines):
        return[line.replace(f"{lib}_", f"{lib}.") for line in lines]

def typefix(lines):
    for line in lines:
        if "F32" in line:
            line.replace("F32", "f32")
        if "S32" in line:
            line.replace("S32", "i32")
        if "U32" in line:
            line.replace("U32", "u32")
        if "S16" in line:
            line.replace("S16", "i16")
        if "U16" in line:
            line.replace("U16", "u16")
        if "S8" in line:
            line.replace("S8", "i8")
        if "U8" in line:
            line.replace("U8", "u8")

    return lines


def main():

    path = sys.argv[1]
    with open(path, "r") as file, open(f"{path}_fixed.v", "w") as fixed:
        lines = file.readlines()

        if sys.argv[2] == "lib":
            lines = delib(lines)
            lines = publify(lines)
            fixed.writelines(lines)
        else:
            lines = dot(lines)
            lines = typefix(lines)
            fixed.writelines(lines)

if __name__ == "__main__":
    main()