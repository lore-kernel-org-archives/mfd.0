Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FB13EBF0C
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785836435; cv=none; b=QFP/MDRIBKKfIbfMVFAMQsR6U58bxX5PrYhiRiokMLmOXlKvxSOycrHLN2UfThh28mD+hH3PUDOCGySsoxz/RBymi4AXSQjgNPxv4cm8Ho9UGqFNVJFzp6EvrzKhZoUqiAJtbm71zsD7Prm3ZXcHD/XJDwNpBmr8sjVlZIHud2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785836435; c=relaxed/simple;
	bh=+tg4HihkjVnqg6IV94Lm31GvSa3PaWyc5O/YQHA4Dcg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bxVUZstOrngPAxlo3b/hx4rk62Mc8oZrtiZ6Rxs8tAvy1hPtiwIwgsdfhdDPo6a5tOkTde195fwi94RukvkCrVSEveYpy8UwR1170kuP8UNNAgQ6KEblGLvr/lO0fFWVwfsyT6mWhqYXZLbHdKkSmKpgMz/7ducPXdCd0IVJr6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFFitz+7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFFitz+7"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cecdc24b1cso6709315ad.1
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 02:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785836432; x=1786441232; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0KP7c64Yl9kvVeMhN4Vu6FcmRJHPM+FSMkVOBoxsZtQ=;
        b=eFFitz+7KPDvwLjeXHX02EeU+l+Aza2cUEsk9n4knUPCPvWpj1NV6EDNamhkH5ffqt
         Ntt8+6cBXWMGTiahPefZ5Bsd9ixJsnFSDhrZ0uarqnyR3GQ6wO/+JYj2JXmvmtrtAUIG
         OhStc8GVtN+QC0977ry9pBjD7JCorLBL5L7C/WbQZfkEeQtSAY+0kidpfK9fyoZjSml0
         OEzH3yOLZfJbd4n2/T5uzIYH58zmoCjHMl+oU8yVmTeN4dzKO8oSQFhDq6t9GAnwog8m
         f/HV7/t0ATpMKqVFUQT/d+rD40qfs726JyX1pItwe5qm6e+ICnNCzXyKjo7dglewgbka
         /x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785836432; x=1786441232;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KP7c64Yl9kvVeMhN4Vu6FcmRJHPM+FSMkVOBoxsZtQ=;
        b=jmuFxb7Gue4CCpZLpIe+01Nn0CU3MX0j3G+PbuR0602t1xEbWuJg7T6y57DLovJJfG
         ACsUegxI3RX6mau5U+iM7pS9Sf9qPCYevvFx7Nm2wjPzUv4r2x8fL9iWQIxiOTVgIf0E
         CekqFE4e/4lYEHOIAfLWYEPx9lcCeDwQexUm/tQhWEss9y2+uOzl+07BSUkWc0uGQXtf
         qA5bAD1ij0+8UapI+uX2oNxHC669BnF0aN1ao0GWLAvknTcXRRyqbFvMbgun4ApnQz01
         v5bIkbJJXc41RdtgIlqBkE3iKdtDuPxklEvOY6iEHZKzFNR5qJ8upJX/3dI/mgzjNOYZ
         AV2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqtWlX4zLAoGpwLtBXidp+SgRhT6VobdqthgaepgYHjsAgmPBq9mJZuOfR6XasBEwOJN80=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTRS79FzLd/t8rBpSoGq1QPicOrsGSWWJXuUT5hAKyYH2EF0CN
	sqipAVOPEaE1SRCdjAONujANDkqzHPBbaD5G/cO1IkQtQtE9hwCAkfRV
X-Gm-Gg: AR+sD105r1t8BJatqL9UWkwwzUH0txkZKGd+sWt+V9xmB5VWeKqkn8Q9CtiMk520shX
	a7Fe7HIhdb1tO43q/wRGFShTdDE5025SyYiN13VZqKPsC6FQeDpZXD1qlQuH82oCUQYvZj5FIte
	Ey8UJVNau26B/CYThVp0AXAniF11PXACAjG+DOHL62oTK2ljhgm7sJJEm86N8Tb1UOHZW7fYyz1
	nxAmeN9+lwsmBiNrKZj7X14HcZnMU8Mlm0L4twBa0xWQMlpFoGpc5d6+beUE5eE93jqHxxm6eub
	GOL0CJlWYeEM+7Cc6Up9J4JGwQkdf+m/wDNdY31y1YV46n6Na5UxnkE1k468D+NIFzFqSlb21U+
	HKCzQv/nXBMQtWN52/aD9zsp9Oqof4XklJpsI5WK+Ki2B+5T78xJesMMvU8wzE3TKYKfCJyAZOe
	A4rMBnqOv9CwUwNE3kcO9rUINwJlklEzpLsLYxFF0lf3/u1aKmS7LMkmBYHjsMqz2IYuZkkVE9P
	ur8TVhT4d0=
X-Received: by 2002:a17:902:c952:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d0521bca53mr200300075ad.1.1785836432230;
        Tue, 04 Aug 2026 02:40:32 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa013da4sm3898605ad.34.2026.08.04.02.40.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2026 02:40:31 -0700 (PDT)
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
In-Reply-To: <anD-LJYB-afdVAXN@mail.minyard.net>
Date: Tue, 4 Aug 2026 17:40:14 +0800
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
Message-Id: <2E268CDE-1D85-4611-BFF7-F74DD36132AB@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-5-e6bc5cdd9a93@gmail.com>
 <anD-LJYB-afdVAXN@mail.minyard.net>
To: corey@minyard.net
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B48=E6=9C=884=E6=97=A5 04:46=EF=BC=8CCorey Minyard =
<corey@minyard.net> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Aug 04, 2026 at 12:55:53AM +0800, Miao Wang via B4 Relay =
wrote:
>> From: Miao Wang <shankerwangmiao@gmail.com>
>>=20
>> There is no strong dependency between the IPMI driver and its mfd
>> driver. Although the IPMI driver will not work without the mfd =
driver,
>> it is not a hard dependency. The IPMI driver can actually be compiled
>> without the mfd driver, and it will just fail to probe. When the mfd
>> driver is loaded, the IPMI driver will probe successfully. Therefore,
>> the dependency of the IPMI driver on its mfd driver should be relaxed
>> to "imply" from "select". This will allow the mfd driver to be =
compiled
>> as a module and the IPMI driver to be compiled as a part of the =
ipmi_si
>> module. The adjustment to Kconfig for the mfd driver will be =
introduced
>> in the later patch in this series.
>=20
> I don't think that's what "imply" is for.  Imply seems to be for if
> there is another subsystem that can use this subsystem, but doesn't
> require it to exist.
>=20
> For instance:
>=20
> config SENSORS_NPCM7XX
>        tristate "Nuvoton NPCM750 and compatible PWM and Fan =
controllers"
>        imply THERMAL
>=20
> The fan controller will work fine without the thermal subsystem; you
> can control the fan speed without it.  But the thermal subsystem is =
the
> logical user of this.  I looked at many of these things like this.
>=20
> In the IPMI case, the IPMI driver is useless without the mfd part.  So
> there's no point in compiling the IPMI part of this if the mfd part is
> not there.
>=20
> I could be wrong, but I can't see why you would want to do this.

The mfd part and the IPMI part loosely depend on each other. Without the
IPMI part, the mfd part can still work to handle the display part.
Without the mfd part, the IPMI part is indeed useless, but it will not
generate compiling errors or other runtime errors. In the runtime,
the IPMI part can be actually loaded earlier than the mfd part. As a
result, their dependency is not that strong.

The reason why I want to change this is that "select" here requires the
mfd part should also be compiled as built-in (i.e. =3D y), since the
type of the configure entry IPMI_LS2K is bool. However, I cannot see
there is no other reason preventing the mfd driver from compiling as
a module. This patch series will introduce a minor fix, after which
the mfd driver will be capable to be compiled as a module.

When the type of MFD_LS2K_BMC_CORE is changed to tristate, the "select"
here will prevent selecting =3Dm for MFD_LS2K_BMC_CORE. I thus believe
that "select" here should be also changed.

Any suggestions on declaring the dependency of the both parts?

Cheers,

Miao Wang=
