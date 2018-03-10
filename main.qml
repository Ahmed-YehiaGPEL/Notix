import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
	id: root
	property var uuid: ""
	property alias text: text_area.text
	//flags: Qt.FramelessWindowHint
	visible: true
	width: 300
	height: 300
	color: "#feff9c"
	title: qsTr("Notix")
	TextArea {
		id: text_area
		anchors.fill: parent
		anchors.margins: 1
		frameVisible: false
		Keys.onReleased: notes_model.text_changed(uuid, this.text)
		style: TextAreaStyle {
			textColor: "#333"
			selectionColor: "steelblue"
			selectedTextColor: "#eee"
			backgroundColor: "#feff9c"
		}
		text: "";
	}

	Button {
		anchors.centerIn: parent
		text: qsTr("+")

		onClicked: {
			var component = Qt.createComponent("main.qml")
			var window    = component.createObject(root)
			window.show()
		}
	}
	Component.onCompleted: {
		if(uuid == "")
		{
			uuid = notes_model.generate_id();
		}
	}
}
