import QtQuick 2.0
import QtQuick.Controls 2.5 as QQC2
import org.kde.kirigami 2.4 as Kirigami

Kirigami.FormLayout {
    id: page

    property alias cfg_nightscoutURL: nightscoutURL.text
    property alias cfg_nightscoutToken: nightscoutToken.text
    property alias cfg_updateInterval: updateInterval.value

    QQC2.TextField {
        id: nightscoutURL
        Kirigami.FormData.label: i18n("Nightscout URL")
    }
    QQC2.TextField {
        id: nightscoutToken
        Kirigami.FormData.label: i18n("Nightscout API token")
    }
    QQC2.SpinBox {
        id: updateInterval
        Kirigami.FormData.label: i18n("Update Interval (minutes)")
    }
}
