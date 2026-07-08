Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFAF42087C
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512977; cv=none; b=OQpwvkJ0V/SwpJLH4druGxR4CvYH2lCeioykm5sk4RGHycaIiJqypO1bmExwEufVzMGK0Y2EXCCyolTziEpjmQr269z3XJ14UR/SG815njxAm0/pR1u+UvNotRmPApP51Rh6ftsrPFlfdDnX+wVdXoQrSwBuaoNZTGmnxCs0JGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512977; c=relaxed/simple;
	bh=89j/Vg+mxUc+a6GV2Yklth3BpvuokAtPW5SuG5t75Mg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uvCTZa3mp5rd077ftIUh2v84RRulBMeTdHHW78ZRiGLxWPhIXmXkR+UyfWzAFG3Mb6v95glRCFagSbEPEhjX4HVU1yC1I4qAfGkmpB9l72/avlse8y1+t+yEvQb4J+vXxhGhuOJSfnzaLqABKT+mIMDl9r6ntKWk0zqf9U+jJ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWqAyyY8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWqAyyY8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cac39b729dso1124575ad.3
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 05:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783512975; x=1784117775; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WtPxIe9ZDXTB4bAnWWhC43OWYPlhSUNmRAB3alNpo8Q=;
        b=CWqAyyY8618AQ9sWh4rczqbst75f3qSy1n76vdLYjRJ0yNzgeJoJqrvW3M/w8DMROB
         bVejNJCnaguoLWnTnnxflx8zZ0wpF1Z3MACAlaYQrk9eXPLl5XMsje8DZd0uGL4jz2xp
         4tl3qXNtLXArk05kpYNo2jBZp0nt4dWHnwXG9iiKCIpi7/bI4mXEZBol3uyh96tGS1xN
         D1boSbOZ1TYhqkSe3HWOvLvd2jmkaZ0J4DOT2s3NLg9A0QPdxjg2sI/UG1wI1NT9zGFT
         bQuoL64slhu9RBt06B96tu9H1Sjf3/brvTaoiUUD4AWlj6yRcDJhn5AMk2UYoURfdV91
         PPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512975; x=1784117775;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtPxIe9ZDXTB4bAnWWhC43OWYPlhSUNmRAB3alNpo8Q=;
        b=dy0m+xKWXbDXclheFlonAMMQzqrirx7ICv7/foCUr93e7SjVrT0dZTG6ZIwofvvqLR
         bH5dc+M2cch1Mg3EPiOGd/SsozgLaGGc8VnmihuwN69LlkO3Ukeaz/K4UmLVsyqSFc10
         AJAVRG4ej9Dyi4mh5eqRzQKySZaMDicFpufyQL8feubPfNM0nrQE1hKHl8D32Ad4Ut8E
         WA4d0ULzjKos8na2eSCq1PDmcxLa3M8eZToIZJx9IubSb1Qd1GrCGveLvKs4qs7dziTq
         ipHW04PfcZnyHca0DJUwhd418//D9GUIshMGfw4QIc3JlBJRiieZEWIyIolF7p8IdzGx
         vJ+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqUucx4A2FpOFuMFtsuhgkRdVDXDerru2JnSpQM8/9W7oJYVmbXIUeEcZ/4C+5pwD5RP7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTsp2rg6fhAPH1ZBx+DyXsH8a7Cqxcmq8AIaziglb0DFXxcig+
	kkYW3sITvCRqwSHw1TtAy0re5ZQpEvH3cFsjBIt1EpoAIafgfaKtrCOn
X-Gm-Gg: AfdE7cnc8LbSvtwMGmGBcXZfC8xVbTzift005nasAZcTXE2n/b/24dUGK3OaLaMLJYV
	mtCQj/cDZlgkLnzHwruB3sUyNfxELEv89Rlrn5sK+kmJfR1FQ5tOZt9dey5XbHHdTJFOlUAHFdg
	b14DOvaRpuS4vzC5MXV6Uf4p/TpkwWPtPZ1Rs0JPMlF++KoMnzh4GwoK2/MQxCCvtmP+anxXGWa
	Y7tubPkgdHThGTUDZhEHNflYMQUjA/xs3kqTLGueRuf5nvCCJNUaixXERZIQBoCZelfrlvh2Ww6
	XyaSI2TEGaYIdd1bY8G9HcNmgO/ZW9YrwhlJ3EceUpJCcPSpIdbf6wtif5OmNS00baL1h97A9qO
	A0kZX7rOj69Z/QX7ZhiicMd9eJYSHlLpc6Gq4UJ8ATCdWEHZJiQWWCNTwXWhJR/CslzgRRJYURB
	Cbi5Or92eWdwGumqKaMc4c5gn5LfceJGPtq1pq8v5gcnJMMg==
X-Received: by 2002:a17:902:d585:b0:2c0:db23:4a6 with SMTP id d9443c01a7336-2ccea33a741mr19490865ad.1.1783512974833;
        Wed, 08 Jul 2026 05:16:14 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e284sm27267735ad.40.2026.07.08.05.16.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2026 05:16:14 -0700 (PDT)
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
In-Reply-To: <CAMRc=MeDq6=u66hc+ChmJA9iKRhsYFhg7rKkCGh2BA=--VGkcw@mail.gmail.com>
Date: Wed, 8 Jul 2026 20:15:55 +0800
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C8B03257-3909-4323-B183-331F7CB1DA3E@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
 <20260708-ls2kbmc-mod-v2-7-2afdd1741766@gmail.com>
 <CAMRc=MeDq6=u66hc+ChmJA9iKRhsYFhg7rKkCGh2BA=--VGkcw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi

> 2026=E5=B9=B47=E6=9C=888=E6=97=A5 19:36=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, 7 Jul 2026 23:16:31 +0200, Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
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
>>    Device (BMC0) {
>>        Name (_ADR, ...) // Match the PCI address of the BMC device
>>        // \_SB.GPO1 is the ACPI path of the GPIO controller
>>        Name (_CRS, ResourceTemplate () {
>>            GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0,
>>                     "\\_SB.GPO1", 0) {
>>                14 // 14 is the GPIO pin number
>>            }
>>    }
>>=20
>> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
>> ---
>> drivers/mfd/ls2k-bmc-core.c | 162 =
+++++++++++++++++++++++++++++++-------------
>> 1 file changed, 115 insertions(+), 47 deletions(-)
>>=20
>> diff --git a/drivers/mfd/ls2k-bmc-core.c =
b/drivers/mfd/ls2k-bmc-core.c
>> index =
f87224105b3720cca97dcef089dad63fe57bc8c2..7187b2dfddc3acfb9fdf3cb3b4675299=
928dd03a 100644
>> --- a/drivers/mfd/ls2k-bmc-core.c
>> +++ b/drivers/mfd/ls2k-bmc-core.c
>> @@ -26,6 +26,9 @@
>> #include <linux/stop_machine.h>
>> #include <linux/vt_kern.h>
>> #include <linux/console.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/gpio.h>
>=20
> I've stopped here because this is a legacy header that must not be =
included
> and none of the interfaces in it must be used, as per the - very loud =
- comment
> at the top of that file.

I fully understand using the legacy interface is deprecated. However, =
there
seems no other way to obtain a gpio line description after a gpio device
is found using gpio_device_find(). As the comment shows in the code =
below,
the only place I use the legacy interface is:

gdev =3D gpio_device_find(...);
desc =3D gpio_device_get_desc(gdev, LS2K_BMC_RESET_GPIO);

// XXX: might be better to use gpiod_request()
legacy_gpio =3D desc_to_gpio(desc);
devm_gpio_request_one(..., legacy_gpio, ...);
return gpio_to_desc(legacy_gpio);

I just borrowed the legacy gpio interface to request the irq =
description. I
think that gpiod_request() should be better to be used here, but it is =
not
an interface that is exposed. As a result, I post this patch as a PoC =
here
to discuss and find a better way to achieve this.

Cheers,

Miao Wang=
