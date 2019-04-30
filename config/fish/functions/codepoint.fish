function codepoint
    echo -n $argv[1] | iconv -f UTF-8 -t UTF-32BE | xxd -p | sed -E 's/^0+/0x/' | xargs printf '\\U%04X\n'
end