local mod = {
  loadOrder = 1,
  onload = function(self, buildUI)
    local constructable = mjrequire("common/constructable")
    return (function(shadow)
      buildUI.createItemList = function()
        shadow()
        return table.insert(buildUI.itemList, constructable.types.stoneWall2x1.index)
      end
    end)(buildUI.createItemList)
  end
}
return mod
