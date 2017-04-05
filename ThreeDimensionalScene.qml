import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

//Creating the root scene
Entity {
    id: sceneRoot

    //Adding camera
    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        nearPlane : 0.1
        farPlane : 1000.0
        position: Qt.vector3d( 0.0, 1.0, 1.0 )
        upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
        viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
    }

    FirstPersonCameraController { camera: camera }

    components: [
        RenderSettings {
            activeFrameGraph: ForwardRenderer {
                camera: camera
                clearColor: "transparent"
            }
        },
        InputSettings { }
    ]

    PhongMaterial {
        id: material
    }
/*******************************************************************************/
    //Ground
    Entity {
        PlaneMesh {
            id: groundMesh
            width: 50
            height: width
            meshResolution: Qt.size(2, 2)
        }

        Transform {
            id: groundTransform
            translation: Qt.vector3d(0, 0, 0)
        }

        components: [
            groundMesh,
            groundTransform,
            material
        ]
    }
/*******************************************************************************/
    //Adding light
    Entity {
        components: [
            PointLight {
                color: "white"
                intensity: 1
                constantAttenuation: 1.0
                linearAttenuation: 0.0
                quadraticAttenuation: 0.0025


            },
            Transform {
                translation: Qt.vector3d(0.0, 5.0, 5.0)
            }
        ]
    }


/*******************************************************************************/
    //And the Iron man model. Read IronMan.qml

    IronMan{
    scale: 0.3
    }

}
