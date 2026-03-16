#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral(RIVEQML_IMPORT_PATH));

    QObject::connect(&engine,
                     &QQmlApplicationEngine::objectCreationFailed,
                     &app,
                     []() { QCoreApplication::exit(EXIT_FAILURE); },
                     Qt::QueuedConnection);
    engine.loadFromModule(QStringLiteral("AnimatedIconsExampleApp"),
                          QStringLiteral("Main"));

    return app.exec();
}
