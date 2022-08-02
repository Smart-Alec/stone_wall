local mod = {
  loadOrder = 1,
  onload = function(self, buildable)
    local action = mjrequire("common/action")
    local constructable = mjrequire("common/constructable")
    local locale = mjrequire("common/locale")
    local resource = mjrequire("common/resource")
    local skill = mjrequire("common/skill")
    local snapGroup = mjrequire("common/snapGroup")
    local clearObjectsSequence = {
      {
        constructableSequenceTypeIndex = constructable.sequenceTypes.clearObjects.index
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
      name = locale:get("object_stoneWall2x1"),
      plural = locale:get("object_stoneWall2x1_plural"),
      summary = "A short stone wall.",
      classification = constructable.classifications.build.index,
      skills = {
        required = skill.types.mining.index
      },
      allowYTranslation = true,
      allowXZRotation = true,
      buildSequence = clearObjectsSequence,
      maleSnapPoints = snapGroup.malePoints.wall2x2MaleSnapPoints,
      requiredResources = {
        {
          type = resource.types.rock.index,
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
