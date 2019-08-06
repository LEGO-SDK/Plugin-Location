package com.opensource.legosdk.plugin.location

import com.opensource.legosdk.core.LGOResponse

class LGOLocationResponse: LGOResponse() {

    var location: String? = null

    override fun resData(): HashMap<String, Any> {
        return hashMapOf(
            Pair("location", this.location ?: "")
        )
    }

}