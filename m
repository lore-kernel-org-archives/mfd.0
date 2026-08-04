Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F06379EF5
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846458; cv=none; b=HZ3B2GTTXsUOeGmjaEkmv97rJsls6Z2dMnTfMa2NtCWk9sVBB1UL4BRi4HAq6zOiMsHJifpRiRUqQXCS3o4PQ7Pokx1kC+EjJJ3NvoJPbGzQKQf92oqGsd9CEIQ6S7U36NmJPkpP6g+cuJ4s0qUf4EFUB+MactWQc7Q0rbfXTuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846458; c=relaxed/simple;
	bh=yGDzYMDqEzxfRj+VONI/uuAUTAp+DAXr1kUgLUWUVgU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Wn/fhPGZ0aGTPpTdnub/thtrmqlDfpDMpjQUk35EH+U6gJA6dlFgCkbSsH68J2RdNHfdUDXXPuRPoBu2FsSG+klpm+P1ke3lD1jAd4CIh+9kxeo+MB3zr59Tw3cUv2ki3M3D3yWQlDkO6dUwwirCl4s/9mTDFy9dhbwfAi/Vai0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPGCzbSa; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPGCzbSa"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84862aaa8bfso435157b3a.2
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 05:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785846456; x=1786451256; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ydf7gjPtgLoVquqb27FOqAQJqlvgvjbaTlwlT6OcC2I=;
        b=sPGCzbSax5ohxwMQJ+slyvXuJPBr8lmhlQ6tpjlnGDYat7TAT8fC7Y4H55f1E+bk05
         ACJU5bNTLb0vVkqUWcu4u9/0mkTzr+MZw9pVVCGWyI/6+r1jrEk6LAZJU1YrzMPSZ4Eb
         kPnN8LsniXnOZBGC5aSgT9zDhwU5zOwp2Oh68AV+DxY/7iFdkihtA8D0ngGHaIapfrRg
         lYrw2rIT0stdXMn+vGhmQE9R214CDwZZu1DnPkEYjiG023o+FluA3sYLQA/t7V3nP7dj
         cc1ojK+IyaPO1dWxRh8jAKZHCQjAoLsZI7RMobZjokFnddSVguVrvHsf2qb45JlO0sud
         qbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846456; x=1786451256;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydf7gjPtgLoVquqb27FOqAQJqlvgvjbaTlwlT6OcC2I=;
        b=fGmsKlkFtsCO9J34oUL+gisFWK6mRXMALsA4fr/FdQRndPLDbIb4Z0nO9Qwv7uF+v+
         qvY5eV8pTWyGkjnm7DrA4H9pUJXfVMg5Q97j1WKy1hlI2txDPnLSgR4Xr5XWPmVvgxsi
         3SrXYCc3w6Jcc/8mAxv9Wp3jAbUmQHE8L3K6/kGMEAvGwbCmEUMhqHrU4o86eugmn98s
         cswBay0f/atBZBqIqM6mq+ksf3aO7FxjTxS+HDEwPHlydozGGsnOjoRycy5Wc66XEL9Y
         GUSC5izIwynznP3h3FS1+aZe4m6kPW5Hi2R2PJPhHFrQgzSlE4YY2+bbzB6QlgQd/a66
         azPQ==
X-Forwarded-Encrypted: i=1; AHgh+RosI+gb1UCcs+Q629eVXFMK9kq2+hx3VyJngVVMLDKOf8bvro193dZYi6dj89R2Oj1LIqc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo2YYdJAPaDScKKkYJLeK8ShdKCfPTe3Al78xfGPT5RgYuQgfl
	WDLd7PBziUzJn72seAAJ1Rsx5VJCZRSQ18KId75Ztf/AsEiIX5gZLDVc
X-Gm-Gg: AR+sD11d7bYzuCPxlEQxcOJoGFM5or/jCFJ57MZ94fdPLnC4PPvVlu0kHaS3U+DSd79
	pUcBmoF5AB6UVb4hhTFc7VaEwttLXmk8tBlhVBZMCF5DGjpEB4gOPsDCVT8iGPtHzjKg7efytZn
	bDKNNJ/25Ry8dDY5ChBQOoMIa1V/m2UqU5zrcrWxO1RUa5NTYZXA79MTS1kJMY1bS1nCOLa7jRo
	TrkjN3KKub1u9Oc+kFj8iXquTY3ihRFlajwTzuFuk6FoLHjVVGYiz6has2nlXIedlU+LW8+Zo4C
	mcUT7fCxtoS5dQwUwgqhEpcROnxrGrIGIYKtBt6b8PRHrnrHEzrPwwCRPwGXulOwiKvcvOkuIK8
	bsQ+P7mzWRTTO3C/e6P0wgozA0TKPg94twYGnpsD4FWhNt2mrZ8nddnDPQCKrKK8e4vlaF+RKAO
	9yWOXXPyUvAfetdzzYRaxkvtSIsjeJ/P+IT687OyflkLPv4Vz3+lCEKv3e3V9xGby0aHwtAwI+v
	7xOnlRrVKFPuxliDb/EoQ==
X-Received: by 2002:a05:6a00:b55:b0:837:95fc:148d with SMTP id d2e1a72fcca58-84ee443e5c3mr17157550b3a.0.1785846455889;
        Tue, 04 Aug 2026 05:27:35 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm5068004b3a.40.2026.08.04.05.27.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2026 05:27:35 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v5 5/7] ipmi: ls2k: Relax the dependency to its mfd
 driver
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <anHPgqIj907WFEGT@mail.minyard.net>
Date: Tue, 4 Aug 2026 20:27:11 +0800
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
Content-Transfer-Encoding: quoted-printable
Message-Id: <34EE213F-DA1A-4103-AAE9-85618954C846@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-5-e6bc5cdd9a93@gmail.com>
 <anD-LJYB-afdVAXN@mail.minyard.net>
 <2E268CDE-1D85-4611-BFF7-F74DD36132AB@gmail.com>
 <anHPgqIj907WFEGT@mail.minyard.net>
To: corey@minyard.net
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B48=E6=9C=884=E6=97=A5 19:39=EF=BC=8CCorey Minyard =
<corey@minyard.net> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Aug 04, 2026 at 05:40:14PM +0800, Miao Wang wrote:
>> Hi,
>>=20
>>> 2026=E5=B9=B48=E6=9C=884=E6=97=A5 04:46=EF=BC=8CCorey Minyard =
<corey@minyard.net> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Tue, Aug 04, 2026 at 12:55:53AM +0800, Miao Wang via B4 Relay =
wrote:
>>>> From: Miao Wang <shankerwangmiao@gmail.com>
>>>>=20
>>>> There is no strong dependency between the IPMI driver and its mfd
>>>> driver. Although the IPMI driver will not work without the mfd =
driver,
>>>> it is not a hard dependency. The IPMI driver can actually be =
compiled
>>>> without the mfd driver, and it will just fail to probe. When the =
mfd
>>>> driver is loaded, the IPMI driver will probe successfully. =
Therefore,
>>>> the dependency of the IPMI driver on its mfd driver should be =
relaxed
>>>> to "imply" from "select". This will allow the mfd driver to be =
compiled
>>>> as a module and the IPMI driver to be compiled as a part of the =
ipmi_si
>>>> module. The adjustment to Kconfig for the mfd driver will be =
introduced
>>>> in the later patch in this series.
>>>=20
>>> I don't think that's what "imply" is for.  Imply seems to be for if
>>> there is another subsystem that can use this subsystem, but doesn't
>>> require it to exist.
>>>=20
>>> For instance:
>>>=20
>>> config SENSORS_NPCM7XX
>>>       tristate "Nuvoton NPCM750 and compatible PWM and Fan =
controllers"
>>>       imply THERMAL
>>>=20
>>> The fan controller will work fine without the thermal subsystem; you
>>> can control the fan speed without it.  But the thermal subsystem is =
the
>>> logical user of this.  I looked at many of these things like this.
>>>=20
>>> In the IPMI case, the IPMI driver is useless without the mfd part.  =
So
>>> there's no point in compiling the IPMI part of this if the mfd part =
is
>>> not there.
>>>=20
>>> I could be wrong, but I can't see why you would want to do this.
>>=20
>> The mfd part and the IPMI part loosely depend on each other. Without =
the
>> IPMI part, the mfd part can still work to handle the display part.
>> Without the mfd part, the IPMI part is indeed useless, but it will =
not
>> generate compiling errors or other runtime errors. In the runtime,
>> the IPMI part can be actually loaded earlier than the mfd part. As a
>> result, their dependency is not that strong.
>=20
> The operational dependency is strong, which is what I think you want =
to
> convey here.
>=20
>>=20
>> The reason why I want to change this is that "select" here requires =
the
>> mfd part should also be compiled as built-in (i.e. =3D y), since the
>> type of the configure entry IPMI_LS2K is bool. However, I cannot see
>> there is no other reason preventing the mfd driver from compiling as
>> a module. This patch series will introduce a minor fix, after which
>> the mfd driver will be capable to be compiled as a module.
>>=20
>> When the type of MFD_LS2K_BMC_CORE is changed to tristate, the =
"select"
>> here will prevent selecting =3Dm for MFD_LS2K_BMC_CORE. I thus =
believe
>> that "select" here should be also changed.
>>=20
>> Any suggestions on declaring the dependency of the both parts?
>=20
> Ok, I understand now.
>=20
> Why can't the IPMI part be compiled as a module?  Making that
> module-capable would be the right fix, I think.  I can't see
> why that wouldn't work.  IIRC, it was bool because the mfd part
> was bool.

I would have agree with you if the IPMI part was a normal driver.
However, the IPMI part is actually a part of ipmi_si. As a result,
the IPMI part can actually be compiled as a module, but as a part
of ipmi_si. That is why the configure entry IPMI_LS2K is bool rather
than tristate. I don't think it is trivial to convert IPMI_LS2K from
bool to tristate.

> If you changed to imply, you would need a depends on the mfd core, =
BTW.

If imply is used here, and there is "select MFD_CORE" in =
MFD_LS2K_BMC_CORE,
I think there is no need to add "depends on MFD_CORE" to IPMI_LS2K, if I
understand it correctly.

I don't insist using imply here, if there is a better way to express the
relation between both drivers.

> Also, IPMI_LS2K needs a "depends on IPMI_SI" either way.  I missed =
that
> earlier.  Could you add that?

If I understand it correctly, there seems to be no need to add the
dependency from the MFD driver to the driver for the actual =
sub-functions.
Examples are:

- MFD_MENF21BMC and SENSORS_MENF21BMC_HWMON, LEDS_MENF21BMC,=20
  MENF21BMC_WATCHDOG: The later three declared depends on the former MFD
  driver
- MFD_INTEL_M10_BMC_CORE and FPGA_M10_BMC_SEC_UPDATE,=20
  SENSORS_INTEL_M10_BMC_HWMON: The later two declared depends on the
  former MFD driver.
- MFD_STMFX and PINCTRL_STMFX: The later declared select the former
  MFD driver.

To summarize, as shown in the current mfd drivers, there is no need to
declare dependency to the drivers providing the sub-functions in the
mfd drivers, and the drivers of the sub functions should "depends on" or
"select" the mfd driver. So if IPMI_LS2K could be tristate, then it =
would
be reasonable to select MFD_LS2K_BMC_CORE or depends on =
MFD_LS2K_BMC_CORE.


Regarding the fact that IPMI_LS2K is bool and it is not an independent
module but a part of ipmi_si, it comes into my mind that we may choose
to adjust the dependency from ipmi_si. That is to remove "select
MFD_LS2K_BMC_CORE" from IPMI_LS2K, and add "select MFD_LS2K_BMC_CORE
if IPMI_LS2K" to IPMI_SI.

I wonder if such a change would be appropriate.

Cheers,

Miao Wang

