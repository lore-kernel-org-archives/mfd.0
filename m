Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B315550DC0
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 13:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082805; cv=none; b=EKaJhhnubAK3J2SKF6PAZOReceDZMeri0cn48CEJg4MuzoygXegSYaZpZP78b31WOcM83cJtWbO6sZdPgjbPW5eQDFiOWgSniQZZgTyQUctVv+Vu9lfd8cIJJQ9BPniCFl7o5doMTd5RmsOFVn0sKHjClBzrc7bI4dsz1ko3OfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082805; c=relaxed/simple;
	bh=7ScoP72loie+KDTnxQPNwCK69btdw+khKMf6M0k1bJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFren+hgCCgX6PfxdC+10ru+7EJEnqwF1H780fZoMrLMx1dvWl/JT5uBWKFnfIrKk9IezYR2ycMsgxsF9ALvMYsLp+szHByqSaaMSLJWKisiBfzMHucIZ62kKLl2xEWD8HhyXXIgCKOgT7FYUiDnnbOPlspOJaU4//tCXgtAHDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Su5wRsSr; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Su5wRsSr"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d4ddd1d91so29715367b3.1
        for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790082802; x=1790687602; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TqBGWJ1w7neWAQnzpWPy+Fm8xr9GVtFmSS2aSnE1bQ=;
        b=Su5wRsSrdQdpKnCrXjx4ndbK21LygkNY/NCxH4/IZMUZP/U+bZBhh+UZdCWmSEZUSl
         rabUua78YnIe2gY37wcIvEDzyvHc9uXipVwfToV5B6aVv0jlsR91/Y3H7+v9G0AYIjtZ
         zBPc/3Te5gUxQECPQ3WPZ91edkiKXnfglTBJIwMWZQxOG3VUpVV0m6tZRGt9jXsaGCOo
         BPNM8igXxDIbn0KTjXDWlxzftySkHwbBwRM/K0N36H7V4n1HtrVXsFKctnbR1Uzc8dj9
         0F+k1bRVUpssicJpYzeHiWC651EzdUtMuhyIAyoJ5CL1xIwtxFJPom+6ycTCsSRd9Tpw
         xfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082802; x=1790687602;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TqBGWJ1w7neWAQnzpWPy+Fm8xr9GVtFmSS2aSnE1bQ=;
        b=zqhAtIpEYsgpJNHWkxf1emfi2w+pAOFu/l0zGoKQhknDRQUsaEkjVsk/D4n3jAUpBs
         Tq5z3w718hjF60+K1LndlBwbLi3aTVSBq9JZ6UNZ9RjWYR7Vc+g46f0JoXEmGvHL9HRl
         4PMQ9Qa4IdKJRv+PXuE/xHJcX3rgdILnJfpnVy317QuhjkhDpvEl2nojORVwbft8AQBv
         GXN7osVicFIhzwx0TtUg0ipYTcXl0EvdmxKsiGCg8jiboA/yG96wo5n/MxYA18S41mMy
         Z0Bbix8BtdL5vGGmJpo5GmIC/gwSTGMQbwOCWZmx39ATBGNwzirnXuBl3Xf8p5rgGs7c
         W/Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzh7kc5XMDgPTdSsKdAk7ZDLOPWLeyA04+2LR11brWxj3fCDqIk4mIDyAM2uDK32PdKr98=@lists.linux.dev
X-Gm-Message-State: AFuF++lTP++gGN/GjGCmyurBaAQj44tglf2eNlm1apnk53xvew+NHfOh
	2WnzpDDLxpLRq9BWTaVxRBNPLpZLlP6G8JBHwu4ddXh8xy9MviZ4qKT3mj3e+/5bSM8=
X-Gm-Gg: AYBFou3a7sjxAWa9XkOb02d37lTEgJGu7dv1VIbSICkMKKr0ZHTSXtN5RXv/wWOBJVT
	QrnrDtTT2ZPiV9LJIUl4jmwbrNWHffDi1JUrW+q5RKkGiU7UMN5bO2vpw/y/8DlZJeHfFp/gNt0
	vyr1tppdBhCZlcH1JWCLMWqILb49PBlrZmcTSbkgyo0j6tJc6ocabelNm0cU2R0b3UG9W2ZUttH
	3ijYuiOYxFze3bF9iL78dVP3tTw6oYZ1r3sQk1UmB9pTMuDJ+oHbR9nZT24Bjy/qtQO9tYI3Wvx
	Wd54+yYjyvG9rTZ/zzeYq0ihndWzGyN6XF7lILapjPnmQcJVjnhSL7+YkUu1LhjaSa2S2VIw/S1
	auVTr4dMoZzt3SjZOBSxpkzMwfhZJ2NM66SZYYg3hx1fhq899rboiSbiw3IrbZtRur/IVKcKnwV
	lbxoViOpO2pOGOxErwo/0vX2niFP0vzpzgT5xY1SHc17WsARijTVR6dZV+G+JQragh6FPpZYUQt
	EQp81z63Q==
X-Received: by 2002:a05:690c:d:b0:81d:472c:17a8 with SMTP id 00721157ae682-8972beadba5mr62389717b3.0.1790082801845;
        Tue, 22 Sep 2026 06:13:21 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2c25bacffsm5463367b3.24.2026.09.22.06.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:13:21 -0700 (PDT)
Message-ID: <1ac16236-284a-4d01-b68a-4b32d5c5287c@riscstar.com>
Date: Tue, 22 Sep 2026 08:13:19 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: clock: introduce
 toshiba,tc9564-clock.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-3-elder@riscstar.com>
 <20260920-messy-successful-caracara-fcdbcd@quoll>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260920-messy-successful-caracara-fcdbcd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 1:21 PM, Krzysztof Kozlowski wrote:
>> diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bindings/clock/toshiba,tc9564.h
>> new file mode 100644
>> index 0000000000000..75732fddd3025
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/toshiba,tc9564.h
>> @@ -0,0 +1,54 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +#ifndef __ClOCK_TOSHIBA_TC9564_H__
>> +#define __ClOCK_TOSHIBA_TC9564_H__
>> +
>> +/* Clock IDs */
>> +
>> +#define CLOCK_MCU		0
>> +#define CLOCK_INTC		1
>> +/* #define CLOCK_PCIE		2 */
>> +/* #define CLOCK_I2C		3 */
> Drop both, and SRAM is number 2. Or enable and implement them.

I forgot to respond to this.  I think you are confused.

SRAM is BAR number 2.  This is defining clock IDs.

And the reason these are commented out is that, while they
do exist, we explicitly do not want anyone to disable either
of these clocks because PCIe uses them.  This clock (and
reset) control is accessed via PCIe.

I do accept that someone might want me to simply omit
these commented-out definitions, and I'd be fine with
that.

But your suggestion wasn't sensible so I wanted to clear
that up before deleting these.

					-Alex
