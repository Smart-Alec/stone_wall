mod = {loadOrder: 1, onload: (buildable) =>
    action = mjrequire "common/action"
    constructable = mjrequire "common/constructable"
    resource = mjrequire "common/resource"
    skill = mjrequire "common/skill"
    snapGroup = mjrequire "common/snapGroup"

    clearObjectsAndTerrainSequence = {
        {constructableSequenceTypeIndex: constructable.sequenceTypes.clearObjects.index}
        {constructableSequenceTypeIndex: constructable.sequenceTypes.clearTerrain.index}
        {constructableSequenceTypeIndex: constructable.sequenceTypes.clearObjects.index}
        {constructableSequenceTypeIndex: constructable.sequenceTypes.bringResources.index}
        {constructableSequenceTypeIndex: constructable.sequenceTypes.bringTools.index}
        {constructableSequenceTypeIndex: constructable.sequenceTypes.moveComponents.index}
    }

    buildable\addBuildable "stoneWall2x1", {
        modelName: "stoneWall2x1"
        inProgressGameObjectTypeKey: "build_stoneWall2x1"
        finalGameObjectTypeKey: "stoneWall2x1"
        name: "Stone Wall" --TODO: Add localizations
        plural: "Stone Walls"
        summary: "A short stone wall."
        classification: constructable.classifications.build.index

        skills: {required: skill.types.mining}

        allowYTranslation: true
        allowXZRotation: true

        buildSequence: clearObjectsAndTerrainSequence

        maleSnapPoints: snapGroup.malePoints.wallMaleSnapPoints --TODO: Add custom snap points

        requiredResources: {
            {
                type: resource.types.rock.index
                count: 2
                afterAction: {
                    actionTypeIndex: action.types.inspect.index
                    durationWithoutSkill: 10.0
                }
            }
        }
    }
}
mod