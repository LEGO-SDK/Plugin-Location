package com.opensource.legosdk.plugin.location

import com.opensource.legosdk.core.*
import org.json.JSONObject

class LGOLocation: LGOModule() {

    override fun buildWithJSONObject(obj: JSONObject, context: LGORequestContext): LGORequestable? {
        val request = LGOLocationRequest(context)
        request.precision = obj.optString("precision")
        return LGOLocationOperation(request)
    }

}