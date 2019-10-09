import QtMultimedia 5.8
import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3

import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    property alias cfg_nightscoutURL: nightscoutURL.text

    GridLayout {
        width: parent.width
        columns: 2

        Text {
            text: "Your Nightscout url (e.g. https://appname.herokuapp.com)"
            color: "white"
            Layout.alignment: Qt.AlignRight
        }

        TextField {
            id: nightscoutURL
            Layout.fillWidth: true
            placeholderText: "https://"
        }
    }
}
