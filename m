Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B8B3932F9
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361360; cv=none; b=lAKJqD3j32z8CAYXwyXPdkKZxtQfY93hwEJ0PI/GluMUSGUg/rok7bEXphpMogKeGtvmzSHZFkBhvvHu97/4UdQRpEH8NZHC0uFCBG4aIkdH6fN4lDJNJNgBjHaaxaA4ljhmsGXe4ybY3+Wq5F2Y023zbHN43ZzCB7ZxvSU4dMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361360; c=relaxed/simple;
	bh=oOhWgBKFgUcwPoQuJLrT3DWJoab0dSEkHi9RoKP2VVU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NhF5qG6+29+wwtBG8kh2zNI12JrBTHN04t/hYnGzreJmB4vkyCl3FlBZ1IT1cIpzRjpVS5F6pHTsRO5n9wrVsS+nbheGYaFoSVllFhXE5aqBM+vG//jrZjGozKrHZ266ybJsWZEYSruBswnSfyMKvuIaIL9uIghKBQOYZpZMN7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzgkUy/d; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzgkUy/d"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so1151965ad.2
        for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 04:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786361358; x=1786966158; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oOhWgBKFgUcwPoQuJLrT3DWJoab0dSEkHi9RoKP2VVU=;
        b=SzgkUy/dOa5BFsW36uwU1isrlUsJfxWtqv/jcIDF+OwNaxeGUb8CT5gNN9Ze7e5z5o
         AaVzRErRlV+klhh5hBvGP1CnYfZ+rX02twDd6mSbdFqDJ1hsdWb/tYD0GecnDeXcnS11
         WD/Kv9XVgS9nKb1nYCelKSE3MZ7UX2Ug4QdBpr4xAhccsR8aNhmXQcc+qlJf7zxj3lVC
         C0GCHnNzYuv1azbOBMDNyCeiIP7jXxxgoRot06VuYonD4lyDLNGEZix5GsQ9GD9aqCUw
         L45m87nusFrpR2uOaYSecyckNu0hBJ2zgfTfbgPNqvZSFObCIOE5kXRVZi2SsiHVHXJ9
         XjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786361358; x=1786966158;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOhWgBKFgUcwPoQuJLrT3DWJoab0dSEkHi9RoKP2VVU=;
        b=ZzZJebVJsrKmSsXYK+EqRiisrZiKQHss+nZgCtJcgYZTlA6ePN1JL7EYWwfDVnW8Iq
         19kDTbWq2IHBW1DFok/BrVjSjpbnswhEBHSCrLW1sIgwna0zc41aQE8mUYOpAwgU6HFt
         xeNKwsUi24p2QLShyN/2X42quXJNu8hjfsxGfzPb28aPgv2xjhci0n1biyLRpFOHRUxl
         Gb6KoilWsoyc0Cd6Zq4eBWfL/L2ijf1LMeagjd+UF8WqGmbDLeJhCCHSQczu6xs0E4vG
         UwEhyxcf/JP8Xwu8k8fugyLLx3X0IawVrRBdZpTaaxno1eQ2o2K0SpddKkCJdPdumAQY
         EdqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+hG2AAqxbj9Kf4SCndGcoi3m9gxf+UTBZvOFRwnuB9NGjJEizPIVa9WMDFQJvAfyG8N8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi2RHpM50Y41VqFHye1To6bx+I2QXmO3FZLoWCYJ80RHgJ7cuS
	aDeDnR2+JQ/XqpON6p57l1a5Lj2DInPJSGRGFKW6bOEVWieGCYHfRCxh
X-Gm-Gg: AR+sD130OohXlBL+jOiesvwVaNQ3xsLoXg2Km2i8/JtEpifegsSxV9cn4QgWticW1V6
	C/6Qg42K+Msbwt6DGE/adCw78c8Ck5jn03Bq/obY3k+SjUgJfCYV8640d9q02RMI1kYzSE3H4OD
	H8RZq0c4SwsrEZ8Zj3COWi3SKvWl0jSvbdhosFS2mzwQx+hF5zrQ3C/r5brBVlQd+027cJ09PsS
	VyK1Kb4+ERpY3DtHZ4XGfdrWzGnmvwN4ym3oKXn1rMESdC9OKPCBi9cb7pE932SniGnnI8pqc58
	pVs5OGriup8En4taFa1sJ3K7jMj0aLx2pyo38xGXqD8Js5jCqNYMwXetxiTyWpoJ1BnYDxvirNW
	EJYcKItZ7i78CkD8S7j2dgxnv5I/PfkDZh4FRTvhx4RlhuI1GBc6Jgg44+jVksksJbeP5WY4OUd
	t3DdMV0XHrkyeE/5IyzK4UZPltFBUrlwXgHohlBlnfmfZqaBIMCpA8JBJECImXvjl5Dur4xeNi4
	ruz/nW5p6A=
X-Received: by 2002:a17:903:2c0c:b0:2cc:d6de:d58e with SMTP id d9443c01a7336-2d0cab4cf8bmr329276335ad.4.1786361358011;
        Mon, 10 Aug 2026 04:29:18 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccd70ecsm34002835ad.20.2026.08.10.04.29.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2026 04:29:17 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v6 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAMRc=Me0DVNYfZJYesvpzTwkVzYZyVzNH+aOAM+DojfV_M9mww@mail.gmail.com>
Date: Mon, 10 Aug 2026 19:28:56 +0800
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
Message-Id: <38DD546D-A2DE-40D7-B6A6-0708162EAA55@gmail.com>
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
 <20260805-ls2kbmc-mod-v6-7-16ccde412d86@gmail.com>
 <CAMRc=Me0DVNYfZJYesvpzTwkVzYZyVzNH+aOAM+DojfV_M9mww@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B48=E6=9C=8810=E6=97=A5 18:14=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, 4 Aug 2026 21:14:25 +0200, Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>=20
>> + gpio_dev_get_fwnode(gdev), LS2K_BMC_RESET_GPIO, GPIO_ACTIVE_HIGH);
>=20
> TBH this could become a GPIOLIB function as gpio_device_get_fwnode().

I wonder if this function should be a static inline function defined
in gpio/driver.h or a normal function defined in gpiolib.c? I tend
to the former.

Cheers,

Miao Wang


