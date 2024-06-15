local function quick_sort(tab)
    local ts=#tab
    local piv=tab[ts]--tab[math.ceil(ts*0.5)]
    local pivi=ts--math.ceil(ts*0.5)
    local left={}
    local right={}
    local lam=1
    for i=1,ts do
        if i~=pivi then
            if tab[i]>piv then
                right[#right+1] = tab[i]
            elseif tab[i]<piv then
                left[#left+1] = tab[i]
            else
                lam=lam+1
            end
        end
    end
    local nleft
    if #left>1 then
        nleft=quick_sort(left)
    elseif #left >1 then
        if left[1]<left[2] then
            nleft={left[2],left[1]}
        else
            nleft={left[1],left[1]}
        end
    else
        nleft=left
    end
    local nright
    if #right>1 then
        nright=quick_sort(right)
    elseif #right >1 then
        if right[1]<right[2] then
            nright={right[2],right[1]}
        else
            nright={right[1],right[1]}
        end
    else
        nright=right
    end
    --nleft[#nleft+1] = piv
    local ls=#nleft
    for i=1,lam do
        nleft[ls+i]=piv
    end
    ls=#nleft
    local rs=#nright
    local ntab={}
    for i=1,ls do
        ntab[i] = nleft[i]
    end
    for i=1,rs do
        ntab[ls+i] = nright[i]
    end
    return ntab
end

return quick_sort

