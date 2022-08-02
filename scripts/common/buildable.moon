mod = {loadOrder: 1, onload: (buildable) =>
    action = mjrequire "common/action"
    constructable = mjrequire "common/constructable"
    locale = mjrequire "common/locale"
    resource = mjrequire "common/resource"
    skill = mjrequire "common/skill"
    snapGroup = mjrequire "common/snapGroup"

    clearObjectsSequence = {
        {constructableSequenceTypeIndex: constructable.sequenceTypes.clearObjects.index}
        {constructableSequenceTypeIndex: constructable.sequenceTypes.clearObjects.index}
        {constructableSequenceTypeIndex: constructable.sequenceTypes.bringResources.index}
        {constructableSequenceTypeIndex: constructable.sequenceTypes.bringTools.index}
        {constructableSequenceTypeIndex: constructable.sequenceTypes.moveComponents.index}
    }

    buildable\addBuildable "stoneWall2x1", {
        modelName: "stoneWall2x1"
        inProgressGameObjectTypeKey: "build_stoneWall2x1"
        finalGameObjectTypeKey: "stoneWall2x1"
        name: locale\get "object_stoneWall2x1"
        plural: locale\get "object_stoneWall2x1_plural"
        summary: "A short stone wall."
        classification: constructable.classifications.build.index

        skills: {required: skill.types.mining.index}

        allowYTranslation: true
        allowXZRotation: true

        buildSequence: clearObjectsSequence

        maleSnapPoints: snapGroup.malePoints.wall2x2MaleSnapPoints --TODO: Add custom snap points

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