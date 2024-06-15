local function bubblesort(tab)
    local size=#tab
    for i=1,size do
        for ii=1,size-i do
            if tab[ii]> tab[ii+1] then
                local v2=tab[ii]
                tab[ii]=tab[ii+1]
                tab[ii+1]=v2
            end
        end
    end
    return tab
end

return bubblesort