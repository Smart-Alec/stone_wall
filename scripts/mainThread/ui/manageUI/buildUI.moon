mod = {loadOrder: 1, onload: (buildUI) =>
    constructable = mjrequire "common/constructable"

    ( (shadow) ->
        buildUI.createItemList = ->
            shadow!

            table.insert buildUI.itemList, constructable.types.stoneWall2x1.index
    
    ) buildUI.createItemList
}
mod