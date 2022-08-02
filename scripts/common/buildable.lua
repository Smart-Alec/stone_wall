local mod = {
  loadOrder = 1,
  onload = function(self, buildable)
    local action = mjrequire("common/action")
    local constructable = mjrequire("common/constructable")
    local resource = mjrequire("common/resource")
    local skill = mjrequire("common/skill")
    local snapGroup = mjrequire("common/snapGroup")
    local clearObjectsAndTerrainSequence = {
      {
        constructableSequenceTypeIndex = constructable.sequenceTypes.clearObjects.index
      },
      {
        constructableSequenceTypeIndex = constructable.sequenceTypes.clearTerrain.index
      },
      {
        constructableSequenceTypeIndex = constructable.sequenceTypes.clearObjects.index
      },
      {
        constructableSequenceTypeIndex = constructable.sequenceTypes.bringResources.index
      },
      {
        constructableSequenceTypeIndex = constructable.sequenceTypes.bringTools.index
      },
      {
        constructableSequenceTypeIndex = constructable.sequenceTypes.moveComponents.index
      }
    }
    return buildable:addBuildable("stoneWall2x1", {
      modelName = "stoneWall2x1",
      inProgressGameObjectTypeKey = "build_stoneWall2x1",
      finalGameObjectTypeKey = "stoneWall2x1",
      name = "Stone Wall",
      plural = "Stone Walls",
      summary = "A short stone wall.",
      classification = constructable.classifications.build.index,
      skills = {
        required = skill.types.mining
      },
      allowYTranslation = true,
      allowXZRotation = true,
      buildSequence = clearObjectsAndTerrainSequence,
      maleSnapPoints = snapGroup.malePoints.wallMaleSnapPoints,
      requiredResources = {
        {
          type = resource.types.stone.index,
          count = 2,
          afterAction = {
            actionTypeIndex = action.types.inspect.index,
            durationWithoutSkill = 10.0
          }
        }
      }
    })
  end
}
return mod