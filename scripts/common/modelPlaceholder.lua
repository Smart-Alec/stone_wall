local mod = {
  loadOrder = 1,
  onload = function(self, modelPlaceholder)
    local gameObject = mjrequire("common/gameObject")
    local model = mjrequire("common/model")
    local resource = mjrequire("common/resource")
    local getRemaps
    getRemaps = function(key)
      return {
        model:modelIndexForModelNameAndDetailLevel(key, 1),
        model:modelIndexForModelNameAndDetailLevel(key, 2),
        model:modelIndexForModelNameAndDetailLevel(key, 3),
        model:modelIndexForModelNameAndDetailLevel(key, 4)
      }
    end
    local getModelIndexForStandardRemaps
    getModelIndexForStandardRemaps = function(placeholderInfo, remaps, placeholderContext)
      if remaps then
        local remap = remaps[model:modelLevelForSubdivLevel(placeholderContext.subdivLevel)]
        if remap then
          return remap
        end
      end
      return placeholderInfo.defaultModelIndex
    end
    return modelPlaceholder:addModel("stoneWall2x1", {
      {
        multiKeyBase = "rock",
        multiCount = 2,
        defaultModelName = "stoneWallSegment",
        resourceTypeIndex = resource.types.rock.index,
        defaultModelShouldOverrideResourceObject = true
      },
      {
        key = "rock_store",
        offsetToStorageBoxWalkableHeight = true
      }
    })
  end
}
return mod
