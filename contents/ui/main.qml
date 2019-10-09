import QtMultimedia 5.8
import QtQuick 2.7
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.kquickcontrolsaddons 2.0
import org.kde.plasma.private.digitalclock 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0

Item {
    property int read_interval: 30000

    property string nightscoutURL: Plasmoid.configuration.nightscoutURL

    Plasmoid.compactRepresentation: CompactRepresentation { }

}
