local function truqiuck(tab)
    --if #tab <= 1 then return tab end
    local left={}
    local right={}
    local sta=math.ceil(#tab*0.5)
    local sv=tab[sta]
    for i=1,#tab do
        local v=tab[i]
        if v<sv then
            left[#left+1]=v
        elseif v>sv then
            right[#right+1]=v
        end
    end
    local nr
    local nl
    
    if #left>1 then
        nl=truqiuck(left)
    else
        nl=left
    end
    nl[#nl+1]=tab[sta]
    if #right>1 then
        nr=truqiuck(right)
    else
        nr=right
    end
    for i=1, #nr do
        nl[#nl+1]=nr[i]
    end
    return nl 
end

local function quicksort_var(tab)
    local counts={}
    local exists={}
    for i,v in pairs(tab)do
        if not counts[v] then
            counts[v]=0
            exists[#exists + 1] = v
        end
        counts[v]=counts[v]+1
    end
    local done=true
    exists=truqiuck(exists)
    local ctab={}
    for i,v in ipairs(exists)do
        for ii=1,counts[v] do
            ctab[#ctab+1] = v
        end
    end
    return ctab
end

return quicksort_var