
import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.kquickcontrolsaddons 2.0

GridLayout {
    anchors.fill: parent
    rows: 2
    columns: 1

    PlasmaComponents.Label {
        id: currentBG

        text: "???"
        Layout.alignment: center
        //anchors.centerIn: parent
        font {
            family: plasmoid.configuration.fontFamily || theme.defaultFont.family
            weight: plasmoid.configuration.boldText ? Font.Bold : theme.defaultFont.weight
            italic: plasmoid.configuration.italicText
            pixelSize: 24
        }
    }
    Timer {
        id: textTimer
        interval: read_interval
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: readData()
    }


    function readData() {
        var request = new XMLHttpRequest();
        request.onreadystatechange = function() {
            if (request.readyState == XMLHttpRequest.DONE) {
                if (request.status == 200) {
                    var j = JSON.parse(request.responseText);

                    currentBG.text = (j.bgs[0].sgv + " mg/dl");
                    currentBG.color = "white";
                }
            }
        }
        console.log(nightscoutURL);
        if (nightscoutURL.charAt(-1)) {
            nightscoutURL = nightscoutURL.substring(1);
        }

        request.open("GET", nightscoutURL + "/pebble");
        request.send();
    }
}
