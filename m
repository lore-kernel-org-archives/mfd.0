Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1C747887E
	for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786625718; cv=none; b=cc5eVqk+mgvENoe/vjshxbFO/miqriVvE7DYPFhIVeAq/mOEFdlF/LNNQNyZ9o9scJKRlqz13douDgyEstl9IoZIDeRbrQv5MpBIVsf7a4goa1Qc9DuVF8mvaiRDBQXuK23hOnpa1sAjBUbK2UwadTtpa6J9LK/Bcd/1tbTnp/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786625718; c=relaxed/simple;
	bh=HrpuHtXRs3lkzPV2KF4jr4RPVBEPyIUfTr35gw5M1iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQklAOVtX6DFjMLaE4yF97Emk4ErRDjPIqUPhDFSYmBCh+gUS7GIx0Sg7nLLWaYXDZKoLURfUZ4Eigja1FrYbnMCVBv6ZCfl/7HVITf58sU25nTBAUgUt7Cc2EfZA6XGzhWzdlG5IPnjYfQK9/xUMh3mLaUhn8ahIaaQQ3Bal0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tdtqz7lg; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tdtqz7lg"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b2aab18795so726885e87.2
        for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 05:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786625714; x=1787230514; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jhcvNWSwuNAllGIhB4lzw/CqsOc6VTmvp2k274Uc3o=;
        b=Tdtqz7lgBmaUIVonffirYC+8/BuyQ0/V5FbXCjIEZhNfSTsHEkq0QVffs/ikQUiWVu
         5rKThH9h939Mq/Rarr3SSkQclFU4OLnzhgs+3pvc/Yq7odPEHQ6AGsDizZfOKzFMDolr
         Cjzsx2ry+xDcG0qR87anbgOohvqKhUx6+VD/DCTlPi6XDcysvVBL8fRwv5SeR0yPBA3L
         G8181s0TTK/Vk6W9WlMU2gX6wX5iCC5RdNNROg6FEW4seGg6SJKIFDJeXJh4p7Ef0Qn1
         ju1+Lw7r790FghtAErvrbhMoHMo5reYSJjYMEo9QF0GCS0S4IZVvz+rEBa5ELharaiqU
         QAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786625714; x=1787230514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jhcvNWSwuNAllGIhB4lzw/CqsOc6VTmvp2k274Uc3o=;
        b=b0fGXGVwwa2XbxKgP43n2OVp0ijfNc7IVUXd70615VFsAJTBY+CHz/DpHLh9cSjemz
         CIEtQo9zcnbZFxilnA4WOaYNfOzWlGIFhcr5DWt9CeimTtB0mps1oLjKhmmWEkHZjRSe
         IzOJoRPb6cS487nz3N7z/FYMFGgYp0wjzpv4x6lZYDZG/hl668KELMVzEmKNpUu5V0+j
         I/bc/ZBgnCseHBYC+2HcyP8O8pD/mf3dyPtMqL4kSmB7DhXIGOUZ0qDhsk6+8mB9V5Fo
         8HzbvvJL8hX5ncuxQnWdTeGYMZx3t5bxuR5dCXTH7I1DbYna2m7eEW/se4JtkHBhu087
         N5vA==
X-Forwarded-Encrypted: i=1; AHgh+Rr97+FsJ+ECmXeUPaV4eqoBFjaXWlC+2t02QeIqAnJo594CUxMwY4zsPF04dcwG6+d0hjk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0AlErJjB0J69yLAP+KEMjTX0dkE2bFB6vMmhQ1gvg3QLTGaAq
	Bqy+RaSxaXIFMW+tbeLpbwxtJ2HDZ7BI2oE6OkMA37dxy3548uHast7s
X-Gm-Gg: AR+sD135dWTK38v0AZEU9rUCR5DMmQoA1gLxR91IWdIpERcNah+QaWFwALyGEno0w01
	Gb6pWUtZzfeMyVQqLakjV/0ciGodistTffVsH5zp6iXa+PhvzHtnuhdm00Gfr+DGkeXhORSm5cJ
	z/aedY8lqGruTfc9FGywErz/fXM4aYlzAnih2XoUhgktoXZF+canGTw2ZbppzKVYtybHDdOiqJF
	gfZDtPcyeNysVCFVnKdWK0StWpX+hBTw780avfFn1DRWrt8KjgbXNQGUHfML/DZmQHfAtdm8T7H
	zspt5MtC2PLUC4uu3RNlrbAn7hsZZXie1ADGkqSONZTe96UbkTOtCLCQ2x2cw7RhbwcA4AiU9Br
	3DmlmDQXTzIlvU1I80O+JNavJt12yorB6yzq+7dtxaqcIyFFyyhbAUwjfzQQkySEiSvHwrJqmG6
	92jSuKcbNWPZiMubX84sRV9nRLHG7dBcxOM5hLpGyyav1WfjTLknuvKAXiRlAZEDtWso10MuP8n
	hzKq+Fq4BSxIG88DWc4+wUyMD9r4pXCgV8UQ/hZHDr5O4U4bXzOsjvI
X-Received: by 2002:a05:6512:1284:b0:5ae:b0c0:16bc with SMTP id 2adb3069b0e04-5b453f77a1dmr809693e87.27.1786625714101;
        Thu, 13 Aug 2026 05:55:14 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539ea237sm456405e87.18.2026.08.13.05.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 05:55:13 -0700 (PDT)
Message-ID: <12f70e0f-5cef-4035-9b44-e2cb252932cf@gmail.com>
Date: Thu, 13 Aug 2026 15:55:12 +0300
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Linus Walleij <linusw@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1785838584.git.mazziesaccount@gmail.com>
 <9774b8d6663ea55b1682b32f825ec5689be3e1d8.1785838585.git.mazziesaccount@gmail.com>
 <CAD++jLmatJFfqhNWfgx=qUW2fEwuatxmJR7NyJLAv45LfLHZnw@mail.gmail.com>
 <f5c241a2-00a8-4a32-bad5-3c89fb204b25@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <f5c241a2-00a8-4a32-bad5-3c89fb204b25@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/08/2026 11:34, Matti Vaittinen wrote:
> On 07/08/2026 23:29, Linus Walleij wrote:

...

>>   * @fixed_direction_output:
>>   *                      (Optional) Bitmap representing the fixed 
>> direction of
>>   *                      the GPIO lines. Useful when there are GPIO 
>> lines with a
>>   *                      fixed direction mixed together in the same 
>> register.
>>
>> It seems you can set up the fixed_direction_output mask from OTP
>> and just use the library, right?
> 
> The BD73800 uses different registers for 'out' and 'in'. So there aren't 
> really "GPIO lines with a fixed direction mixed together in the same 
> register".

...

> I think the BD73800 can indeed use the gpio-regmap, by keeping the pin 
> direction information in private data and adding a custom xlate, which 
> errors out if get is requested for output pin, or set is requested for 
> input. I am not sure how much of an improvement it is compared to the 
> patch v2, but I'll give it a shot :) I believe the new -rc1 isn't that 
> far away, and hopefully the gpio-regmap -stuff from the next will be in 
> it together with the regulator stuff bindings depended.

Gah. Please, ignore the erroring-out part. I don't know where I picked 
the idea that the hardware would always return '0' when reading the 
GPO_OUT register. I think this might have been something I have 
experienced on a setup where the pin was _not_ set to GPO by OTP. 
Furthermore, the xlate will never get called if user tries to set value 
for a GPI pin.

Anyways, implementing xlate with op-check allows me to support this 
PMIC, even though the register to read for pin status depends on OTP.

So yes, v3 should be able to use gpio-regmap. I will probably delay 
sending it until v7.3-rc1 is out so I get (all?) dependencies in.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
