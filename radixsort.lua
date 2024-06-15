local function maximum(tab)
    local max=tab[1]
    local ts=#tab
    for i=1,ts do
        if tab[i]>max then
            max=tab[i]
        end
    end
    return max
end
local function radixsort(tab)
    --"AAAAAAAAAAAAAAAAAAAAAA"
    return tab
end

return radixsort

