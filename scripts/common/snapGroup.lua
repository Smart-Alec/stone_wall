local mod = {
  loadOrder = 1,
  onload = function(self, snapGroup)
    local mjm = mjrequire("common/mjm")
    local vec3 = mjm.vec3
    snapGroup.malePoints.wall2x1MaleSnapPoints = {
      {
        snapGroup = snapGroup.maleTypes.wallEdgeBottomX.index,
        point = vec3(-1.0, 0.0, 0.0),
        normal = vec3(-1.0, 0.0, 0.0)
      },
      {
        snapGroup = snapGroup.maleTypes.wallEdgeBottomX.index,
        point = vec3(1.0, 0.0, 0.0),
        normal = vec3(1.0, 0.0, 0.0)
      },
      {
        snapGroup = snapGroup.maleTypes.thinWallMiddleBottomZ.index,
        point = vec3(0.0, 0.0, 0.0),
        normal = vec3(0.0, 0.0, 1.0)
      },
      {
        snapGroup = snapGroup.maleTypes.thinWallMiddleBottomZ.index,
        point = vec3(0.0, 0.0, 0.0),
        normal = vec3(0.0, 0.0, -1.0)
      },
      {
        snapGroup = snapGroup.maleTypes.thinWallMiddleTopZ.index,
        point = vec3(0.0, 1.0, 0.0),
        normal = vec3(0.0, 0.0, 1.0)
      },
      {
        snapGroup = snapGroup.maleTypes.thinWallMiddleTopZ.index,
        point = vec3(0.0, 1.0, 0.0),
        normal = vec3(0.0, 0.0, -1.0)
      }
    }
  end
}
return mod
