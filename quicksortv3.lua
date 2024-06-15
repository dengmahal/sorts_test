local function swap(tab, firstindex,secondindex)
    local temp=tab[firstindex]
    tab[firstindex]=tab[secondindex]
    tab[secondindex]=temp
end
local function partition(tab,left,right)
    local pivv=tab[right]
    local partitionindex=left
    for i=left,right-1 do
        if tab[i]<pivv then
            swap(tab,i,partitionindex)
            partitionindex=partitionindex+1
        end
    end
    swap(tab, right, partitionindex)
    return partitionindex
end

local function quicksort(tab,left,right)
    left=left or 1
    right=right or #tab
    if left >=right then
        return
    end
    local pivi=partition(tab,left,right)
    quicksort(tab,left,pivi-1)
    quicksort(tab,pivi+1,right)
    return tab
end
return quicksort
