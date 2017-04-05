#include <QtWidgets/QApplication>
#include <QtQuick/QQuickView>
#include <QtQml/QQmlContext>
#include <QtQml/QQmlEngine>
#include <QUrl>


int main(int argc, char *argv[])
{
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    QQuickView viewer;

    /*
     * if you want you can create custom c++ backend and call slots of them from qml
     *
    viewer.setTitle(QStringLiteral("360Shop"));
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    BackEnd backend(viewer);
    viewer.rootContext()->setContextProperty("backEnd", &backend);
    QObject::connect(viewer.engine(), &QQmlEngine::quit, &viewer, &QWindow::close);
    */


    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.show();
    return app.exec();
}
