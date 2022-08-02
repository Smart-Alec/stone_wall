mod = {loadOrder: 1, onload: (modelPlaceholder) =>
    gameObject = mjrequire "common/gameObject"
    model = mjrequire "common/model"
    resource = mjrequire "common/resource"

    getRemaps = (key) ->
        {
            model\modelIndexForModelNameAndDetailLevel(key, 1)
            model\modelIndexForModelNameAndDetailLevel(key, 2)
            model\modelIndexForModelNameAndDetailLevel(key, 3)
            model\modelIndexForModelNameAndDetailLevel(key, 4)
        }
    
    getModelIndexForStandardRemaps = (placeholderInfo, remaps, placeholderContext) ->
        if remaps
            remap = remaps[model\modelLevelForSubdivLevel placeholderContext.subdivLevel]
            if remap
                return remap
        return placeholderInfo.defaultModelIndex
    
    -- I have no clue about this

    --TODO: Rock Variations?

    ----------------------------

    modelPlaceholder\addModel "stoneWall2x1", {
        {
            multiKeyBase: "rock"
            multiCount: 2
            defaultModelName: "stoneWallSegment"
            resourceTypeIndex: resource.types.rock.index
            defaultModelShouldOverrideResourceObject: true
        }

        {
            key: "rock_store"
            offsetToStorageBoxWalkableHeight: true
        }
    }
}
mod