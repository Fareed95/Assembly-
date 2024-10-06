###################################################################################################
# AUTHOR : FAREED SAYED 
# DATE :  05 OCTOBER 2024 
# PURPOSE : TO AUTOMATE THE WORK OF ASSEMBLY FILE COMPILATION AND TO GENERATE THE OUTPUT 
####################################################################################################

read -p "Enter your file name in asm: " filename 
if  [ -z "$filename" ]; then
    echo "Please enter a valid file name"
    exit 1
fi

# Check if the assembly file exists (without appending .asm)
if  [ ! -f "$filename.asm" ]; then
    echo "File not found"
    exit 1
fi

# Ask user if they want to generate a listing file
read -p "Do you want to make a listing binary file [y for YES and n for NO]? " listing
if [ "$listing" = "y" ]; then
    # Assemble the assembly file and create a listing file
    nasm -f elf64 "$filename.asm" -o "${filename}.o" -l "${filename}.lst" 
else
    # Assemble the assembly file without a listing file
    nasm -f elf64 "$filename" -o "${filename}.o"
fi

# Link the object file to create an executable
ld -m elf_x86_64 "${filename}.o" -o "${filename}"

# Update permissions to make the executable runnable
chmod +x "${filename}"

# Execute the compiled program
./"${filename}"

# Clean up the object file (and listing file if it was generated)
rm "${filename}.o"
rm "$filename"


# completion
