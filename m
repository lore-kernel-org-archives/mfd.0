Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571CB56B872
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098448; cv=none; b=Bqha4yu6YINRP2mZZEcO/rZ8FNSjo42UFH2NyMFe1QUocPwU6878nev49KFRqmxJQDHltU1LVIbfqou8BwLlx4odDiFPuqOsKjJoyambGDycxH/UbvwuzopCeMpjOemOjUUdtqPrOVbAFlXiL4VPuRzqFhcSng951LSzvLMospI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098448; c=relaxed/simple;
	bh=k62lXyffQpfvoXLrJkljRwAuyGHOT0TxBUmsYyaQxeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgGgyJeE45lK0mgOb0IzCiou0VW+Gcmf3eilQCmZ8ux+kBWna0cr2TXmLlgiQw6FzdFDN4zM+lNthopTDlZrlzHL5zD8S64ZIMrVKJypOl9NnhSuZasOGfUlqyZZjvGG7Q1HAbIEkyqV3VjdLnR+cB3Z40vUZN2cKPhL1dD5gJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myQoSvwx; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myQoSvwx"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c1b8d7b5so18679e87.0
        for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 10:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790098444; x=1790703244; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yuuzD7pETxcjGtdgpLYjcgyqt6WFmTw9RRQGOf5Uv14=;
        b=myQoSvwxEfSXTerTbMEDILq4y+fLCbzoI7fgh9PzBuy1ejAuGuc5ouIyrQCiPySuDu
         QVXVf7QQywpw48xcLv1WhycEQkchSGeOFHdfznlycLf6GOUAm6QMc8Fo3DPoCrdvlUlP
         beP28UjPCpoh7HyowKKf1qhqmx6cdKnoz4er2sBEriJmy4tmlf13Tze4iM2Eu+ev9khw
         fRJW+J5xU3+2rENmmZGXP6v7eB34+xCsnHH/2PMg9vyUYWDrA2bkZuDOoeqJiUlyArsf
         M1rEONWGB5OYBX+y2g1eaYI4MmDK/L8mDn9zrWCn1wLlA7xYErmErkHKmJfgVOPVXEHw
         AbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098444; x=1790703244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yuuzD7pETxcjGtdgpLYjcgyqt6WFmTw9RRQGOf5Uv14=;
        b=OmB6VfskBZ3HtkycY9tZA7Tyqmw6UQb7M146tqXBVJlSO18/w6ZHiu28eBMlQOHpQJ
         Krj19dKSCahDUylhcm1Kz4pZLVk9ANS9wkMnUKjmhqKZ1fyhWw+LiHXsapKivpZIVjWq
         ms4/V4r1QerTcNmneO+k9mDW1MFBOg3r8fGxT46gxiwX3CuDE/ZxlsxILUuHIkKq9Y0V
         WaljPHi38F8vCb2ts3mHFkh8OHxsv4ium7ZsbTTlwyPlG53nH4KeSWzHaEQjpHYY0xy+
         w6we9ah/QSy0UeOSuaR0dyOk4O5eFUdENv5lONv0tS+/TD/5WuoxzKzzSGc3iQ3nFzDo
         kruA==
X-Forwarded-Encrypted: i=1; AKwUvBxLQb3foWzkxKSwSGp6S1mTx+KCmxQWyKZycVS0V6VqtR/8WgoiFUP/t50mFUbApMUSfb4=@lists.linux.dev
X-Gm-Message-State: AFuF++nsQMK8P+MJ9ffUy8w9ZM1cwb+lRuFdkdLtuACBUVWA2e4gDQfo
	re8d9SlICcS9xLJ7TndjerjBvbgP8pAVk5NxbU9FhWwfV2Pi+QNP6gxV
X-Gm-Gg: AYBFou3x+No0PSygUgYakborPCFGVdc4wuLeciKFJB/J8hhv6/bX8NmWYfmCLnr9t6V
	XVOMPatwB+yRwq4He670Y+SnW0fTY1SM5YW8T+wZdc6qm3Z6HTC+Fw3Ako0tyhrEwI9VhfCOvgJ
	AA6BzEv/LmrTWJPuHEVA7e6rDQi1QFxpC3ScvWiqJQ+SxpWeytVcuK8PAJyKYzxhNGQBA8TDCDB
	uGnea+noQ8gU22hvPtD22GSAG4+NgkvxFVwb/ztgatn1sp33rDylcNb4JIixPA0xA8mM7UDjEeo
	VMuoMu0JpKWZVFiE5Z7vCM54ZsdeLn2nvtMunpg6e59HEfjNlFPqu6XHO6YmMn2/oz+04mzEx59
	tA6HcXBExfBA5DGsEqX8SWHj+I4ADXZPFRfqIDL+hO10d3ulblSDV6G/+xqRywkiJoII/aKRPyz
	Dh4hKJO4r1EiCey46Q+wtc6fJ4Wr8f47LrDlnXkVk/vG8yyVVrMvrwO7B/WwgjJswScPc+DYlam
	F9RlqYdh67+OMfEbDB9vnWvyc5VN9fEytLkHyAfFjPGqWm0C4gjAi0=
X-Received: by 2002:a05:6512:6881:10b0:5b8:9963:12df with SMTP id 2adb3069b0e04-5b8d8960c1bmr764e87.9.1790098444004;
        Tue, 22 Sep 2026 10:34:04 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d858f129sm41541e87.63.2026.09.22.10.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:34:01 -0700 (PDT)
Message-ID: <df84b2b6-e4a4-4751-9923-6001f78db0a2@gmail.com>
Date: Tue, 22 Sep 2026 20:34:00 +0300
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] mfd: Support for ROHM BD73800 PMIC core
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, Sverdlin@mva-rohm,
 Alexander <alexander.sverdlin@siemens.com>
References: <cover.1789538455.git.mazziesaccount@gmail.com>
 <3e3a25abe337e3f68cde585674019dca439ac897.1789538455.git.mazziesaccount@gmail.com>
 <20260922154543.GA3438784@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260922154543.GA3438784@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/09/2026 18:45, Lee Jones wrote:
> On Wed, 16 Sep 2026, Matti Vaittinen wrote:
> 
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The BD73800 integrates regulators, ADC (intended for accumulating current /
>> voltage / power values), a real-time clock (RTC), clock gate and GPIOs.
>>
>> Add core support for ROHM BD73800 Power Management IC.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Acked-by: Lee Jones <lee@kernel.org>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>
>> ---
>> Revision history:
>>   v3 => v4:
>>    - Removed extra whitespace from the end of a file.
>>   v2 => v3:
>>    - Translated this:
>>      https://lore.kernel.org/all/20260813105955.GA1820248@google.com/
>>      to an ack. Please, let me know if this isn't ok.
>>   v1 => v2:
>>    - styling
>>    - update copyright years
>> ---
>>   drivers/mfd/Kconfig              |  15 +-
>>   drivers/mfd/rohm-bd71828.c       | 147 ++++++++++++++-
>>   include/linux/mfd/rohm-bd73800.h | 306 +++++++++++++++++++++++++++++++
>>   include/linux/mfd/rohm-generic.h |   1 +
>>   4 files changed, 461 insertions(+), 8 deletions(-)
>>   create mode 100644 include/linux/mfd/rohm-bd73800.h
> 
> Looks okay.
> 
> Let me know when you have all of the Acks and we'll merge it via MFD.

Thanks Lee,

I think all of the patches had relevant ACKs/RBs already in the previous 
revision. Eg, AFAICS this is good to go.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
