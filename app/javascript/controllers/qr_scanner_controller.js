// creaed a new JS Controller file for QR Scanning Feature, 24 Feb 2023. Jay

import { Controller } from "@hotwired/stimulus"
import * as ZXing from '@zxing/library'

// Connects to data-controller="qr-scanner"
export default class extends Controller {
  connect() {
    console.log("QR Scanner")

    this.selectedDeviceId;
    this.codeReader = new ZXing.BrowserQRCodeReader()
    console.log('ZXing code reader initialized')

    this.codeReader.getVideoInputDevices()
      .then((videoInputDevices) => {
        console.log("this is code reader initilizing get video")
        const sourceSelect = document.getElementById('sourceSelect')
        this.selectedDeviceId = videoInputDevices[0].deviceId
        if (videoInputDevices.length >= 1) {
          videoInputDevices.forEach((element) => {
            const sourceOption = document.createElement('option')
            sourceOption.text = element.label
            sourceOption.value = element.deviceId
            sourceSelect.appendChild(sourceOption)
          })

          sourceSelect.onchange = () => {
            this.selectedDeviceId = sourceSelect.value;
          };

          const sourceSelectPanel = document.getElementById('sourceSelectPanel')
          sourceSelectPanel.style.display = 'block'
        }

      })
      .catch((err) => {
        console.error(err)
      })
  }

  startcamera() {
    this.decode();
    console.log(`Started decode from camera with id ${this.selectedDeviceId}`)
  }

  offcamera() {
    this.codeReader.reset()
    document.getElementById('result').textContent = '';
    console.log('Reset.')
  }

  decode() {
    this.codeReader.decodeFromInputVideoDevice(this.selectedDeviceId, 'video').then((result) => {
      console.log(result)
      document.getElementById('result').textContent = result.text
      // FETCH SHOULD BE HERE.. oR PATCH
      window.open(result, '_self',)
    }).catch((err) => {
      console.error(err)
      document.getElementById('result').textContent = err
    })
  }



}
