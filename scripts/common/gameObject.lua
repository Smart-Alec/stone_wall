local mod = {
  loadOrder = 1,
  onload = function(self, gameObject)
    local mjm = require("common/mjm")
    local vec3 = mjm.vec3
    local vec2 = mjm.vec2
    local normalize = mjm.normalize
    local vec3xMat3 = mjm.vec3xMat3
    local mat3Identity = mjm.mat3Identity
    local mat3Rotate = mjm.mat3Rotate
    local mat3Inverse = mjm.mat3Inverse
    local snapGroup = mjrequire("common/snapGroup")
    gameObject.gameObjectsTable["stoneWall2x1"] = {
      modelName = "stoneWall2x1",
      scale = 1.0,
      hasPhysics = true,
      isBuiltObject = true,
      preventShiftOnTerrainSurfaceModification = true,
      preventGrassAndSnow = false,
      blocksRain = false,
      femaleSnapPoints = snapGroup.femalePoints.standardWallFemaleSnapPoints,
      isPathFindingCollider = true,
      objectViewRotationFunction = function()
        return mat3Rotate(mat3Identity, 0.5, normalize(vec3(0.0, 1.0, 0.0)))
      end
    }
  end
}
return mod
