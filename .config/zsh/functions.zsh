
md2pdf() {
    # If an argument is provided, process only that file
    if [ -n "$1" ]; then
        if [[ "$1" == *.md ]]; then
            filename="${1%.md}"
            echo "Converting $1 to ${filename}.pdf..."
            pandoc -o "${filename}.pdf" "$1"
        else
            echo "Error: File '$1' does not have a .md extension."
        fi
    else
        # No argument provided: loop through all .md files in the current directory
        for file in *.md; do
            [ -e "$file" ] || { echo "No .md files found."; break; }

            filename="${file%.md}"
            echo "Converting $file to ${filename}.pdf..."
            pandoc -o "${filename}.pdf" "$file"
        done
    fi
    echo "Done."
}


normalizemoji(){
    for f in *; do
        mv "$f" "$(echo "$f" | sed $'s/\ufe0f//g')"
    done
}
