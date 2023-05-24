
import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.kquickcontrolsaddons 2.0

ColumnLayout {
    PlasmaComponents.Label {
        id: currentBG
        text: "???"
    }

    Timer {
        id: textTimer
        interval: updateInterval * 60 * 1000
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
                    var bgs = j.bgs[0];
                    var trend = trendArrows[bgs.trend];

                    currentBG.text = bgs.sgv + " mg/dl " + trend;
                }
            }
        }

        if (nightscoutURL.charAt(-1)) {
            nightscoutURL = nightscoutURL.substring(1);
        }

        request.open("GET", nightscoutURL + "/pebble/?token=" + nightscoutToken);
        request.send();
    }
}
