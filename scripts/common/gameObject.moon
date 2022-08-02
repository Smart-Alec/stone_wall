mod = {loadOrder: 1, onload: (gameObject) =>
    mjm = require "common/mjm"
    vec3 = mjm.vec3
    vec2 = mjm.vec2
    normalize = mjm.normalize
    vec3xMat3 = mjm.vec3xMat3
    mat3Identity = mjm.mat3Identity
    mat3Rotate = mjm.mat3Rotate
    mat3Inverse = mjm.mat3Inverse

    snapGroup = mjrequire "common/snapGroup"

    gameObject.gameObjectsTable["stoneWall2x1"] = {
        modelName: "stoneWall2x1"
        scale: 1.0
        hasPhysics: true
        isBuiltObject: true
        preventShiftOnTerrainSurfaceModification: true
        femaleSnapPoints: snapGroup.femalePoints.wall2x2FemaleSnapPoints --TODO: Add custom snap points
        isPathFindingCollider: true
        objectViewRotationFunction: ->
            mat3Rotate mat3Identity, 0.5, normalize vec3(0.0, 1.0, 0.0)
        objectViewOffsetFunction: ->
            vec3(-0.5, 0.0, 1.0)
        markerPositions: {
            {localOffset: vec3(0.0, mj\mToP 1.5, mj\mToP 0.5)}
            {localOffset: vec3(0.0, mj\mToP 1.5, mj\mToP -0.5)}
        }
    }

    gameObject.gameObjectsTable["build_stoneWall2x1"] = {
        modelName: "stoneWall2x1"
        scale: 1.0
        hasPhysics: true
        isInProgressBuildObject: true
        preventShiftOnTerrainSurfaceModification: true
        femaleSnapPoints: snapGroup.femalePoints.wall2x2FemalSnapPoints --TODO: Add custom snap points
        objectViewRotationFunction: ->
            mat3Rotate mat3Identity, 0.5, normalize vec3(0.0, 1.0, 0.0)
        objectViewOffsetFunction: ->
            vec3(-0.5, 0.0, 1.0)
        markerPositions: {
            {localOffset: vec3(0.0, mj\mToP 1.5, mj\mToP 0.5)}
            {localOffset: vec3(0.0, mj\mToP 1.5, mj\mToP -0.5)}
        }
    }
}
mod