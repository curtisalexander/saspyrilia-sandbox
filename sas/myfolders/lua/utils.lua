local module = {}

--- Rename columns by making all column names lowercase, stripping whitespace, and replacing spaces with underscores
-- @param inlib
-- @param inds
-- @param outlib
-- @param outds
-- @param inplace
module.rename_cols = function(inlib, inds, outlib, outds, inplace)
  local dsid = sas.open(inlib .. '.' .. inds)
  local renameList = ''
  
  for v in sas.vars(dsid) do
    vclean = string.gsub(string.gsub(string.lower(v.name), "^%s*(.-)%s*$", "%1"), "%s+","_")
    if v.name ~= vclean then
      renameList = renameList .. ' ' .. "'" .. v.name .. "'n" .. ' = ' .. vclean
    end    
  end
  
  sas.close(dsid)
  
  if string.len(renameList) ~= 0 then
    if inplace then
      sas.submit([[
        proc datasets library=@inlib@ nolist;
          modify @inds@;
          rename @renameList@;
        quit;
      ]], {inlib=inlib, inds=inds, outlib=outlib, outds=outds})
    else
      sas.submit([[
        data @outlib@.@outds@ ;
          set @inlib@.@inds@(rename=(
            @renameList@
          ));
        run;
      ]], {inlib=inlib, inds=inds, outlib=outlib, outds=outds})
    end
  else
    sas.submit([[
      data @outlib@.@outds@ ;
        set @inlib@.@inds@;
      run;
    ]], {inlib=inlib, inds=inds, outlib=outlib, outds=outds}) 
  end
end

return module