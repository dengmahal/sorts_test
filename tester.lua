print("started-------"..os.clock())
local iterations=15
local tab_size=2e5
local random_size={0,1e6}
local algs_to_test={"default","quicksortv1","quicksortv2","quicksortv3","quicksortv3dup"}
local function sort(a,b)
    return a<b
end
local function def_sort(tab)
    table.sort(tab,sort)
    return tab
end

local algs={
    ["default"]=def_sort,
}
 
for dir in io.popen([[powershell dir -name]]):lines() do
    if string.match(dir,".lua") and dir~="tester.lua" then
        algs[string.gsub(dir,".lua","")]=require(string.gsub(dir,".lua",""))
    end
end
local times={}
local function check_sorted(tab)
    if #tab>tab_size then
        return false,"array larger than expected"
    end
    if #tab<tab_size then
        return false,"array smaller than expected "..#tab
    end
    for i=1,tab_size-1 do
        if tab[i]>tab[i+1] then
           return false,"array not sorted"
        end
    end
    return true
end


local function bench()
    for i=1,#algs_to_test do
        times[algs_to_test[i]]={}
    end

    for it=1,iterations do
        local this_tab={}
        for ii=1,tab_size do
            math.randomseed(ii*0.33*it)
            this_tab[ii]=math.random(random_size[1],random_size[2])
        end

        for i=1,#algs_to_test do
            local tosort={}
            for iiii=1,tab_size do
                tosort[iiii]=this_tab[iiii]
            end
            local start_time=os.clock()
            local sorted_tab=algs[algs_to_test[i]](tosort)
            times[algs_to_test[i]][it]=os.clock()-start_time
            local succ,msg=check_sorted(sorted_tab)
            if succ==false then
                print(algs_to_test[i]..": "..msg)
            else
                print(algs_to_test[i]..": sorted")
            end
        end
    end

    print("results [avs time in s] @ iterations:"..iterations.." ;table_size:"..tab_size.." ;random_size:"..random_size[1].." to "..random_size[2])
    for i=1,#algs_to_test do
        local totT=0
        for ii=1,iterations do
            totT=totT+times[algs_to_test[i]][ii]
        end
        print(algs_to_test[i]..":",math.floor((totT/iterations)*1e8 +0.5)/1e8)

    end
end
bench()