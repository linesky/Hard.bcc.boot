extern "C"
declare sub putss(s as zstring ptr)

public sub MAIN()
    const c="hello world....."
    
    putss c
end sub
end extern
MAIN
