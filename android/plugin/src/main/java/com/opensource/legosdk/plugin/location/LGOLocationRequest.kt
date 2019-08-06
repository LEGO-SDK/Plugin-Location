package com.opensource.legosdk.plugin.location

import com.opensource.legosdk.core.LGORequest
import com.opensource.legosdk.core.LGORequestContext

/**
 * Created by cuiminghui on 2017/10/17.
 */

class LGOLocationRequest(context: LGORequestContext?) : LGORequest(context) {

    var precision: String? = null

}