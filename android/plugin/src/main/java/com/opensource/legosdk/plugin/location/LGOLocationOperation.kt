package com.opensource.legosdk.plugin.location

import com.opensource.legosdk.core.LGORequestable
import com.opensource.legosdk.core.LGOResponse

/**
 * Created by cuiminghui on 2017/10/17.
 */
class LGOLocationOperation(val request: LGOLocationRequest): LGORequestable() {

    override fun requestSynchronize(): LGOResponse {
        return LGOLocationResponse().accept(null)
    }

    override fun requestAsynchronize(callbackBlock: (LGOResponse) -> Unit) {
        callbackBlock.invoke(requestSynchronize())
    }

}