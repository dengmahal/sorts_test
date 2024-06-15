local function check_sorted(tab)
    for i=1,#tab-1 do
        if tab[i]>tab[i+1] then
            return false
        end
    end
--    print("holy it did it")
    return true
end
local function bogosort(tab)
    local ntab={}
    while #tab>0 do
        local rand=math.random(0,#tab)
        ntab[#ntab+1]=tab[rand]
        table.remove(tab,rand)
    end
    if check_sorted(ntab)==true then
        return ntab
    else
        local nntab=bogosort(ntab)
        return nntab
    end
    
end
return bogosort