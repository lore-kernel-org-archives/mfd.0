Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD793470EBB
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 18:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784746791; cv=none; b=PCdk22LGuHR7xrk+INnMyRH2kSIkoJSYCxWMpJ3q5sSXYqplDeGJytnAbXVNyPdiukWdHoloXMe53FU5y0nwSfHmRwX8jL4g8/bmovkWSvc2q7VqcN3l6yFQA4pb2g1YMZK9oYKNwJapOWbjUFfiU4vo75RanZox4vB3lvn30mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784746791; c=relaxed/simple;
	bh=SWE5xEokraCLrBzxKLFN3ueo1NNiNLPdJXP9d9dXNx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLM/Mi8EAoVgUhM3LMgRj3yIppttoLHtm9Ire/dSUM4dHa607j7xPVDdtm4gGxAzzE3Q09QWjLbnRo3I3ln2tuq+zVY8YQR4Ug91laasKRGvlV2bN9JOSogM0gB42RP7mToH6WBwGzPhXyEsJXiJnGn1k0sb62sllLhLa+QUjX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWvP9uM/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWvP9uM/"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso9870661b3a.2
        for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 11:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784746789; x=1785351589; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6ZLC0o0pPH5ppMj1NKH//VtPE1br/BJv/qJB9TBuCI=;
        b=PWvP9uM/sJOF8A1w7AjPnL4LFvvVbBtnjPtc58inj9PVFP9AFSlZzOOoNfV31hgfBJ
         QjtiXf/gTvrMOO+OJU67uSca8D4e3tXKF07oNS4JpulYOKugvTF6QiHyMFuWey/+U9h+
         3qbqSPv4YhwxY5Ms3S1GbFzfHrunxFI2bC1NZphAZaWQBc4Oh7gt+kDGhiUFNbFYe3ZS
         9tdqw/t523jdSnkqv2EznCehGscSroAJsKyVGLZdQKkZWO4I+8GZMOObKT1FjzvT/DlP
         e4o6QYFPr4qtAPsjGIj0mb/+2c0VwqE+QH0TMMICSb7p/u0YUVkU5IBca7nyrP9lX4J3
         NIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784746789; x=1785351589;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p6ZLC0o0pPH5ppMj1NKH//VtPE1br/BJv/qJB9TBuCI=;
        b=IVoI4nlV9laUaRzzv5XLb/QwT4WLLNVCoDuVSeyYAMDDlQHaQv8quoRK3aBPr7D/QC
         gt1h0QbTvJAYM9gffP0X4uJHPgHY4CaH86frMCo9iyaYS7bs7/JRuVte40/f5jAxwFMF
         JQXVyG8WZSNf1WPhPxa9GssZcCybRek8q0RXRBhbS5/gUAIkgDtUy72Uh68nt2xi7VYI
         h7G+oxRYYd+AgLIwcBkeFNouIJUrMYBayLY+HAZr22N8wpbMwmcClqfXrw3tGHM3IA4o
         ELek4LMDymX2NjCckVSs6R/ynCJ4vyIiTWrxpjiMveCEmY2/CMDtzV2x58HeVz3XGBMt
         mFig==
X-Forwarded-Encrypted: i=1; AHgh+Rr3weoOGqa0dmVO0tBIpv5ia5pfRh3fj/liOO/UpI7WSAxf+Zurth1/wQE/97wdnIfu1yo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCWPDU788rYNFRl9WNKGgrwAb/enn19JQZQ20NhYq3CiKrhrYz
	LnZrs3KxwJ3sfJAN5OQ53FQWoiAntVdOMsf97EbE70NQDpVnZ/s9DzH6
X-Gm-Gg: AR+sD114NzLASxgb21606WJrMbFoE5D6e4qB7EDHGlXhAhpuaPEY5C/fjg1sHVHl+AN
	TRxw8g4T6pPsfRd30QItGI8+Hcn0B7lx5VdoA+4kVWtGDqaB3U4elo/h1hv1QBKrTedkPQy6Qnp
	N2cxXfaUduyn6tBEet+NoGZ9+j1EPUUo7tdbi/2r7co3LWo5PS3CmlRcuT7qEox5E13vRMdyrj/
	pjJzcHI45iMAO/v3NoUW8AoRjbmvTMGt8/Hu0/mD7k2kjA8RaX1nxNW32PJj0qZgrpOr9nyZQZz
	pD8qwSBg0B7NzEefz8nSKbrsU7X5OHbrJpHtvyW2fGiu6YIkeenbCObRNnoZNCUWvQzWbnWrGr+
	Wc0svdfOcNmiu1Lf6sLu7A4xBRAUCtd0nksqFhQCw2VHh6oQjM44hD2DVu7pLKblNBSfxEYCAD+
	C6ba5AqBAEUXP+eXFaUvSZLEpmlk/c4j+Ip8x5N0fPdbS+hWk6wBw=
X-Received: by 2002:a05:6a00:a88e:b0:848:2f84:f42c with SMTP id d2e1a72fcca58-84e2bc1a3f9mr113390b3a.69.1784746788971;
        Wed, 22 Jul 2026 11:59:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebeeesm1509889a12.10.2026.07.22.11.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 11:59:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3635cd34-4c11-40fe-a9ff-48b752fb5150@roeck-us.net>
Date: Wed, 22 Jul 2026 11:59:47 -0700
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
 <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
 <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
 <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/22/26 11:19, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Guenter,
> 
> On 7/22/2026 11:16 PM, Guenter Roeck wrote:
>> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
>> ...
>>>>
>>>> I am curious: Why not use static initialization and use the is_visible
>>>> function to determine if an attribute is visible or not ?
>>>
>>> ACK. There is already a comment in v1 suggesting the use of dynamic allocation based on the available attributes rather than static initialization. The intent is to avoid having to perform enable flag checks in multiple places.
>>> . >
>>
>> You lost me, sorry. There is only a single is_visible function,
>> and its intent is exactly to handle situations where some sensors
>> are not always available.
>>
>> What would be those "multiple places" ?
> 
> Understood, thanks for the clarification. I'll revert to static attribute initialization in the next revision and use is_visible() to control attribute visibility where needed.
> 
>>
>>>>  From the earlier exchange I had the impression that there is a large
>>>> number of current and voltage channels, but it looks like there is only
>>>> one each. That doesn't really warrant or need all this dynamic code
>>>
>>> Yes, this hardware only supports one or two channels (voltage and current). What we discussed earlier was that each channel can have up to three threshold alarms (warning, critical, and emergency). However, the hwmon framework currently supports only two limit alarms for these sensor types. I have not added support for the third alarm threshold in this series to keep the initial driver support aligned with the existing hwmon capabilities. Once the basic driver support is accepted, I can queue a follow-up series to add support for the third limit alarm.
>>>
>>
>> What does that have to do with attribute visibility ?
> 
> I was only clarifying that the channel count has always been small (maximum of two channels) and has not changed since v1. The earlier discussion was primarily around the limit alarm attributes. That said, you're right that this is unrelated to attribute visibility.
> 

Feel free to use (and test)
https://lore.kernel.org/linux-hwmon/20260722185749.2313572-1-linux@roeck-us.net/T/#u

Guenter

