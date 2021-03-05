package com.example.demo_reconoserid

import android.os.Bundle
import com.reconosersdk.reconosersdk.http.OlimpiaInterface.CallbackSolicitudProceso
import com.reconosersdk.reconosersdk.http.olimpiait.entities.`in`.Ciudadano
import com.reconosersdk.reconosersdk.http.olimpiait.entities.`in`.SolicitudProceso
import com.reconosersdk.reconosersdk.http.olimpiait.entities.out.RespuestaTransaccion
import com.reconosersdk.reconosersdk.http.olimpiait.entities.out.SolicitudProcesoOut
import com.reconosersdk.reconosersdk.ui.LibraryReconoSer
import com.reconosersdk.reconosersdk.ui.servicesOlimpia.ServicesOlimpia
import com.reconosersdk.reconosersdk.utils.JsonUtils
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.util.*
import com.google.gson.Gson


class MainActivity: FlutterActivity() {

    var asesor = "keos"
    var codeClient = UUID.randomUUID().toString()
    var sede = "979262"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        GeneratedPluginRegistrant.registerWith(flutterEngine!!)
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, "example/saludo")
                .setMethodCallHandler { call: MethodCall?, result: MethodChannel.Result? ->
                    if (call != null) {
                        if (call.method == "saludo"){
                            val name = call.arguments as String
                            if (result != null) {
                                result.success(sayHello(name))
                            }
                        }
                    }
                }
    }

    private fun sayHello(name: String): String{

        //Consulto si el convenio está activo
        LibraryReconoSer.init(getApplication(), getApplicationContext(), "4C4BB3A9-1961-4B52-820D-3F4BA0522DAF", "")

        var convenioGuid = "Valor inicial"

        //Creación del proceso.
        val solicitudProceso = SolicitudProceso()
        solicitudProceso.setAsesor(asesor)
        solicitudProceso.setGuidConv("4C4BB3A9-1961-4B52-820D-3F4BA0522DAF")
        solicitudProceso.setSede(sede)
        solicitudProceso.setCodigoCliente(codeClient)
        solicitudProceso.setInfCandidato(null)
        solicitudProceso.setFinalizado(false)
        val ciudadano = Ciudadano()
        ciudadano.setTipoDoc("CC")
        ciudadano.setNumDoc("1019077632")
        ciudadano.setEmail("dev@prueba.pru")
        ciudadano.setCelular(" ")
        solicitudProceso.setCiudadano(ciudadano)

        Log.e("TAG_RID", solicitudProceso.toString())

        ServicesOlimpia.getInstance().getProcessRequest(solicitudProceso, object : CallbackSolicitudProceso {
            override fun onSuccess(solicitudProcesoOut: SolicitudProcesoOut) {
                convenioGuid = solicitudProcesoOut.procesoConvenioGuid.toString()
                Log.e("TAG_ConvenioGuid", "Success : " + convenioGuid)
            }

            override fun onError(respuestaTransaccion: RespuestaTransaccion?) {
                Log.e("TAG_ERROR", respuestaTransaccion?.let { JsonUtils.stringObject(it) }.toString())
                convenioGuid = respuestaTransaccion?.let { JsonUtils.stringObject(it) }.toString()
                Log.e("TAG_ConvenioGuid","Error : " + convenioGuid)
                /*showDialogError("Error en transacción "+ (respuestaTransaccion).errorEntransaccion.get(0).codigo,
                        "Documento incorrecto");*/
            }
        })

        return convenioGuid
    }
}

