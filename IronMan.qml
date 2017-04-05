import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
    id: root

    property real x: 0
    property real y: 0
    property real z: 0
    property real scale: 1.0


    //COPY RenderableEntity.qml in your project!!!!!!
    RenderableEntity{
        id: chest
        source: "qrc:/man.obj" //Path to iron man model. You can open it with 3D Builder on Windows 10
        position: Qt.vector3d(root.x, root.y, root.z)
        scale:  root.scale

        material: DiffuseMapMaterial {
            id: material
            diffuse: "qrc:/man.png" //Path to the texture image. You can get it by converting .tga to .png
            specular: Qt.rgba( 0.2, 0.2, 0.2, 1.0 )
            shininess: 2.0
        }
    }
}
