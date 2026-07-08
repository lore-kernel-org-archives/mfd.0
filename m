Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80CF409629
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520232; cv=none; b=VY+YDJVhuo2/aXvYIToythXl55ZChIaK6KGNokAlPh5TX515iAhEF/FbiiC5EeA6GfFpsZO8vheByVT31BNL0f25JFkxI4uRPTZ7FT3Ect0HQbPL8FFUbm7J9FILgE/Havgp3eqgtX0HyVg9sXMLZczp0qC8U6vA8PFoOVB1bHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520232; c=relaxed/simple;
	bh=KytUjyWbmgxMPWGG2wJePUNjrnm6PwIYazV5AliXqU0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=h9TBjOvd2FU0CjH8MRwZXRojIcjwk9CdD0jMYN6+PAykJGZ2tj3NPjECOwy+PBPYa+txCExwYKnwSAczsKT1rjK6KB7CXGuwHeVRws2jJyd5DHcq6Y9kJGl8vKLq+yp6uxPlx0EpH96so8sk6bg87YQid0Go8V/hZRgfhWfpiAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jp63qJ4x; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jp63qJ4x"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cad68425a7so968265ad.1
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 07:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520230; x=1784125030; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d4xgsEpJa1JkMfAC5lrqnM5nTtBq2Z6cq/mQ8FHTkeQ=;
        b=jp63qJ4xS9lgmek6PWg2yPJk78MMNB5BYCcAzMVvvlt2FsjJ80k5m3jPkuAdhNILnv
         WbcvQRATXT2/v/nLEVPRv110EERezewJgFrYpUD+q1U5JadOpdVC9KdCe77CqWJFrUS7
         NXUwuqAXrjvRaTvUzYkTuhyfgc+1F55qxIgmH5iK+NgwTDkaG13dL75o3YsEGvEJMetT
         TW8eW2Ezlos96nl6J3OZ+UwrQnEkelYQWKdpcfo+9rxSj8BhUKsA3djPvR/rvtFrqYFl
         zJMkYxeOeTVRpfDxLN+3cv2ZGpK/AH8KkrLx4358t332vVqieO4yBkUTZVMaERb5Dcze
         Gg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520230; x=1784125030;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4xgsEpJa1JkMfAC5lrqnM5nTtBq2Z6cq/mQ8FHTkeQ=;
        b=EyQ6Sfk1fJhAimCgspnXiODbUWY/pC9YhAPxmS5BBO6qcTdC0YpDQC0Vrh6jETLJHC
         zcMDn8Tiz+4d8EWMMEVR5ukeGxWG+rUyduXis1rvaQv12w0RTbHr4HSDNyFjlQ5OpLdo
         J/TsBPJBSw4MXAUoM0s2FkmDREpHaEW1bgCmTosU0rZ1Ftn+5hr5EO4Jl9e8mOJiRH2B
         rLQ2W9mLa2dt/Nfa+F6fftg6792efchEdDqtvS12UpUu6TC1A8KqHRA67zCfVtpTXIqa
         xYMNrs6SFbQesfyXey1/CC8FQVYh4CssFqQEliOgHFVqfLA9rUgZYnO6T5pYE8uFMYqS
         zsPg==
X-Forwarded-Encrypted: i=1; AHgh+Rr26AqpN5/yGtVMORh/e5LmS0qHf9/RJG9KXMdlEEkldRYjYnX280ltih5hT6HksOeKh6k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqww5CBfrgK2fj7tNMlfvg4cUBQQNcdwt8L7ovV6v6gSGzjLNY
	CPwzUN/bEfjJZj16RV1Jnhl5WlhGSPgdxePdxA6e9/dLUWf3RUaIZ11Z
X-Gm-Gg: AfdE7cnhxp53KxoSu/39Ks2hmr2xlAmn9TU/3zVOS7mFC2vAj4l1xBF4hT0SZKsUeuN
	5+/UY/b9Oa/0PyDYF7AjduNLZutAzbJ7izK52WPNfXmtNERlNznDMF2IWxlv6Ofk3PuhvAU7L7c
	Btr8ytJUHnIaHQlJUhiJYHGHEtrEwUYzw4yxD59p8uqHryeo2VeyDetOEAEVPyubSgvIKyIqsj2
	gyFp5q3iP+U6Nmk4oBYVfleR+l32iPbs4NogYjs+zA+WclT0YXgVjhQZGLC2rz4/vffirJ9bUOh
	UYQ6hr3cqGhoXh0CadsNUhqxVXmLkTPL5lU6p0R9SpjiRDmBcD/FuatoWXY3zJi4nF2LLkVHuAj
	GL/cw77i7uxCtui8zIJCUtUcIj5xSzmWnlKWy2ty0c64bFTUAK9OZtMAoKUcIuK3MIIfQnH/qSY
	P/KjdNeKaGxzHGtn6xR7tODRNJ63vnLSPm4e6VhrhU/L8xnA==
X-Received: by 2002:a17:903:2352:b0:2c9:d298:6c0a with SMTP id d9443c01a7336-2ccea2af751mr20982635ad.2.1783520230041;
        Wed, 08 Jul 2026 07:17:10 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e29asm28773865ad.52.2026.07.08.07.17.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:17:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v2 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <5d6ea500e983035a2e5748e1bbf8ed6c26ac6f4b.camel@xry111.site>
Date: Wed, 8 Jul 2026 22:16:49 +0800
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
Content-Transfer-Encoding: quoted-printable
Message-Id: <D141EDD3-BEC0-458B-B477-9227B3FB93AC@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
 <20260708-ls2kbmc-mod-v2-7-2afdd1741766@gmail.com>
 <5d6ea500e983035a2e5748e1bbf8ed6c26ac6f4b.camel@xry111.site>
To: Xi Ruoyao <xry111@xry111.site>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B47=E6=9C=888=E6=97=A5 21:14=EF=BC=8CXi Ruoyao =
<xry111@xry111.site> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Wed, 2026-07-08 at 05:16 +0800, Miao Wang via B4 Relay wrote:
>> From: Miao Wang <shankerwangmiao@gmail.com>
>>=20
>> The reset event of BMC is captured through GPIO. However, this driver
>> bypasses the GPIO framework and directly accesses the GPIO controller
>> through the fixed address. When the same GPIO controller is also
>> exposed through ACPI and probed by the corresponding GPIO driver,
>> there would be a conflict between the two drivers.
>>=20
>> This patch will try to find the GPIO through declared GPIO pin in the
>> _CRS resources of the ACPI node. If no such delaration is found, the
>> driver will fall back to search for the correct GPIO controller and =
pin
>> according to the fixed address and pin number. A possible DSDT
>> declaration for the GPIO pin might be as follows:
>>=20
>>     Device (BMC0) {
>>         Name (_ADR, ...) // Match the PCI address of the BMC device
>>         // \_SB.GPO1 is the ACPI path of the GPIO controller
>>         Name (_CRS, ResourceTemplate () {
>>             GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0,
>>                      "\\_SB.GPO1", 0) {
>>                 14 // 14 is the GPIO pin number
>>             }
>>     }
>=20
> I think this is a proposal without real implementation yet?  If so...
>=20
> /* snip */
>=20
>> + adev =3D to_acpi_device_node(fwnode);
>> + if (!adev)
>> + goto out;
>> +
>> + INIT_LIST_HEAD(&resource_list);
>> +
>> + ret =3D acpi_dev_get_memory_resources(adev, &resource_list);
>> + if (ret < 0)
>> + goto out;
>> + rentry =3D list_first_entry_or_null(&resource_list, struct =
resource_entry, node);
>> + if (!rentry)
>> + goto free_resource_list;
>> + if (rentry->res->start =3D=3D start_addr)
>> + found =3D 1;
>> +
>> +free_resource_list:
>> + acpi_dev_free_resource_list(&resource_list);
>=20
> ... consider adding a _DSD method to label (like "bmc-reset") the GPIO
> for the proposed BMC0 device so you can use devm_gpiod_get to get the
> GPIO, instead of using the hand-brew code to parse the ACPI node.=20
> See =
https://www.kernel.org/doc/html/latest/firmware-guide/acpi/gpio-properties=
.html.

Yes, it is a proposal. GpioInt() in the _CRS() should be at least
required to associate the BMC device to the GPIO pin. Having a _DSD
might be better to label the gpio pin with human readable label. I
however don't think _DSD is important because there is only one pin
needed, and devm_gpiod_get_index can be used to obtain the gpio line
description using the index in _CRS()

>=20
> Combining this with Bartosz's comment, the logic would be like:
>=20
>  if (missing the ACPI node)
>    assign a swnode to label "gpio14" as "bmc-reset";

I'll further look into whether swnode can be used.

>  gpio_desc =3D devm_gpiod_get(&dev, "bmc-reset", GPIOD_IN);
>=20
> And such a proposal will need to be discussed with Loongson.  Yes I =
know
> people may hate the "control" from the vendor, but having some
> effectively dead code (i.e. supporting some non-exist firmware) in the
> kernel is worse.

I'm open with such discussions.

Cheers,

Miao Wang


