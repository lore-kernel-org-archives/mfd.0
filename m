Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0D43876DE
	for <mfd@lists.linux.dev>; Thu,  3 Sep 2026 05:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411765; cv=none; b=jyJC7JVAcoZHSEes6u9UcO1HAfUm+/RAWixyPLgWwV15UBIvQr/boLpHrHl3SgaF7aWUaBADHvKDqRGk5+CQSyN2rpVa3sRlpOWg+bVZevHlduPQQR5kfKDa85ikvztQtf28pWWhsKBHqVmFxOnHJhTiavYvDvKl4JnGaQ81X6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411765; c=relaxed/simple;
	bh=j8QMTNW8XDHV+BH8mGTNiSJbNMOrQ1E2SamlbJ3guog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4fBtqdEhdPuwiuivkJ6ozh3ySkQ//4H9GXdDugzx3R30IPCk6FGLrOwRGkyLbMOxOTgfXdRJJtWK2Pa5n3yMmjB5AudthV1gF/p1SwGrf+pLiULoYLUVKf8h0GqwiekLHy6KCkH7QMkx9vPI8KpKXSdVO054HA4+VxnoHQLEq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtPwFAGi; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtPwFAGi"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b4a0e5aefeso2084112e87.3
        for <mfd@lists.linux.dev>; Wed, 02 Sep 2026 22:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411760; x=1789016560; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwFiTvSfOdYmNglr5FoVqN597kWfjGSwy7pj4LDNId8=;
        b=OtPwFAGiP6ZVlEcaICc3Cgmq/zwhKMN8luuBkKK7jPxUvJFqz0aIR6f6fTSM+IbWV8
         FANejEJQrDMfBDHdiXM0uc0TT5YaV/CuqN9CrofkyT7UMBirQ0sJ9Z+8nOQmthujHFsS
         4SpuDv6PdV6j+AgjhW/rumsxVK/hr7TH4P10CFAsEOVc57phKo5AaxGYSBCV0TB4TTzB
         csgnu4b8xX79hom5AvXXMpXx4szmJCPeiEhW1hwh+MIzkbVbKJI1Ml2a7i4QEzWcDqAk
         ve9842OTjkd93qf1v16wvRscci+wii695ibySXq8PDUQIrgXBSe10FfQ0plhR4JgdCBR
         y8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411760; x=1789016560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwFiTvSfOdYmNglr5FoVqN597kWfjGSwy7pj4LDNId8=;
        b=PYvU4DWweaU/2Wkqzydfi2/7P2/8fGrtU106M8C+UlFwmDxlEuRfk0op8DK4Ig2C/b
         R1T9YIn51QRdvIGY48MtvYJ3Yzj3+PCit1/JdECeda4WNN58HAYbikuHzqZPXEw9cluP
         8R/uAkPB33lkvrrt/lwNHBvqeQ9DzIuOgW833OVt6icKHEekWjKF1mJwT78rZfmVGYLl
         KLLc6BoI78GwGsmYSNxny0W8NWhnJzNmOHwyhnHWkOZ2r6FBene9TYgctLB6Xg/Vd/St
         ji6UsEm21MoSjA90DbPxXZgpIwavT7dxTsnuEsQKyPL0XogAKKlsMVo/wTpbUF6O2gjd
         4MZg==
X-Forwarded-Encrypted: i=1; AKwUvBwpInlHK/jZr0X6sgSst1dWKE9xRmMfJpiQG4c9F59LmESSrmO2AkqwP5w/f985N8X0bnA=@lists.linux.dev
X-Gm-Message-State: AFuF++nkMK/V0fA0rIssewNuM9ZaxkqglSzVQpvjZinkgMDRdCNdmRx+
	A2uU7mYbEPBqFtEFW2vS5sOy452AScrYt2Zu3CbAzcQxai6P8H+yUUCX
X-Gm-Gg: AYBFou2IsEkuZNzkOjCU3/PeiVrUk7MStKXyDCsCzxSNKhbAA2Vd+wO9EBEtEgCGkuz
	FkIHHwy3QBETi7JDxGiqk7OLKc0IXnUFG82Qe9RhCldikLBp8LXEyMzFJ29Rlz/6x0w7WBNK8Ir
	JS7VyBgf+Ltayhg7mT0HxVHmT1O9qLURuVihvImQonN9VPw+yp8xlb5o6gSuhgx675hGU/CvJv/
	mguWm7g/C1cP68DLb2OSM/qi4cr9/FVVSBGsF7FRWk3v3LkVzYpNDs4uj4ieeaUZp/4LCE3lI3U
	IsldjSv1eH4RUz62pX+dtcJNSl2n7XmWj9Y5AX+sNro7IXcuMZqMmFkhaLCK2nA9ozF6VDk/LzF
	kfl3kQioi1Yldh6bucTKUByZ+Tjf+RL0386At+zfNxgcmXBzfWzsrSK7WHOkJW/PeXPxHrjv/UW
	Q7hiWMLd6mtu39bUEqKvU4g/9arPKedTYelcKBwIkX5PAjDL0p9RuFc93+SovpxTcQTOa0sYH20
	CmgVFESsIcYdIy/rd29rDWIyZBq4rd4CzkWFPTE8VO7
X-Received: by 2002:a05:6512:110d:b0:5b5:fae5:b241 with SMTP id 2adb3069b0e04-5b608559ac7mr3146149e87.14.1788411760490;
        Wed, 02 Sep 2026 22:02:40 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b1cd21sm1021897e87.29.2026.09.02.22.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 22:02:39 -0700 (PDT)
Message-ID: <c2d07f77-1fe1-4d5c-af6b-703d4d767a83@gmail.com>
Date: Thu, 3 Sep 2026 08:02:39 +0300
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Linus Walleij <linusw@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <5eb294e68b8d5d2c1d3a12b14a55dd2a9c075a09.1788346553.git.mazziesaccount@gmail.com>
 <CAD++jLkvELVwVD2B-OPF=mV8-F5xi7RZWJ7cvuyg2srnrJ2HLQ@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAD++jLkvELVwVD2B-OPF=mV8-F5xi7RZWJ7cvuyg2srnrJ2HLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/09/2026 15:39, Linus Walleij wrote:
> Hi Matti,
> 
> thanks for your patch!
> 
> On Wed, Sep 2, 2026 at 1:07 PM Matti Vaittinen
> <matti.vaittinen@linux.dev> wrote:
> 
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The ROHM BD73800 PMIC has 4 pins (named GPIO1, CLKOUT, FAULT_B and
>> EXTEN_OUT) which might have been set to operate as a GPI or GPO when OTP
>> (One Time Programmable memory) is written at device manufacturing.
>> Support the GPI/GPO use-case via GPIO framework.
>>
>> The default OTP for these pins is to not use any of them as GPI or GPO.
>> (The GPIO1 defaults as an ADC input regardless the naming). Hence the
>> driver assumes none of these pins is a GPI/GPO unless explicitly pointed
>> as GPI or GPO via device tree.
>>
>> Furthermore, pin's direction can't be changed after OTP configuration is
>> done. Also the default drive type for a GPO (CMOS / Open Drain) is set
>> by the OTP configuration. The BD73800 has a set of undocumented test
>> registers which should allow changing the drive type. Access to the test
>> register area or the test registers aren't documented and so this driver
>> does not support configuring the drive type even though it might be
>> doable.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Pretty neat with gpio-regmap isn't it? :)

Yep. I like the added flexibility now that it has got those callbacks a 
driver can register... ;)

> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
